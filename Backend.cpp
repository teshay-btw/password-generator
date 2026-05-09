#include "Backend.h"
#include <qvariant.h>
#include <string>
#include <iostream>
#include <algorithm>
#include <qdebug.h>
#include <Windows.h>

using namespace std;

void Backend::setRoot(QObject* root)
{
	m_root = root;
	text_area = m_root->findChild<QObject*>("passwords_area");
	file_name = m_root->findChild<QObject*>("userinput_file_name");
}

Q_INVOKABLE void Backend::enable_symbols(bool checked)
{
	if (checked == true)
		is_symbols_enabled = true;
	else is_symbols_enabled = false; 
}

Q_INVOKABLE void Backend::enable_numbers(bool checked)
{
	if (checked == true)
		is_numbers_enabled = true;
	else is_numbers_enabled = false;
}

Q_INVOKABLE void Backend::enable_lowercase(bool checked)
{
	if (checked == true)
		is_lowercasecharacters_enabled = true;
	else is_lowercasecharacters_enabled = false;
}

Q_INVOKABLE void Backend::enable_uppercase(bool checked)
{
	if (checked == true)
		is_uppercasecharacters_enabled = true;
	else is_uppercasecharacters_enabled = false;
}

Q_INVOKABLE void Backend::exclude_similarcharacters(bool checked)
{
	if (checked == true)
		is_similarcharacters_excluded = true;
	else is_similarcharacters_excluded = false;
}

Q_INVOKABLE void Backend::exclude_ambigiouscharacters(bool checked)
{
	if (checked == true)
		is_ambigiouscharacters_excluded = true;
	else is_ambigiouscharacters_excluded = false;
}

Q_INVOKABLE void Backend::enable_savetofile(bool checked)
{
	if (checked == true)
		is_savetofile = true;
	else is_savetofile = false;
}

Q_INVOKABLE void Backend::enable_certain_amount_of_passwords(bool checked)
{
	if (checked == true)
		is_certain_amount_of_passwords = true;
	else is_certain_amount_of_passwords = false;

}

Q_INVOKABLE void Backend::button_pressed()
{
	

	std::string all_symbols;
	std::string final_lowercase = lowercase_letters;
	std::string final_uppercase = uppercase_letters;
	std::string final_numbers = digits;
	std::string final_symbols = symbols;

	if (is_similarcharacters_excluded) {
		
		final_numbers.erase(std::remove(final_numbers.begin(), final_numbers.end(), 0), final_numbers.end());
		final_numbers.erase(std::remove(final_numbers.begin(), final_numbers.end(), 1), final_numbers.end());

		for (char el : similar_symbols) {
			final_lowercase.erase(std::remove(final_lowercase.begin(), final_lowercase.end(), el), final_lowercase.end());
			final_uppercase.erase(std::remove(final_uppercase.begin(), final_uppercase.end(), el), final_uppercase.end());

		}

	}

	if (is_ambigiouscharacters_excluded) {
		
		for (char el : ambigious_symbols) {
			final_symbols.erase(std::remove(final_symbols.begin(), final_symbols.end(), el), final_symbols.end());
		}
	}
	if (is_numbers_enabled) all_symbols += final_numbers;
	if (is_lowercasecharacters_enabled) all_symbols += final_lowercase;
	if (is_uppercasecharacters_enabled) all_symbols += final_uppercase;
	if (is_symbols_enabled) all_symbols += final_symbols;
	
	std::random_device rd;
	std::mt19937 gen(rd());
	std::uniform_int_distribution<> dist(0, all_symbols.size() - 1);

	if (is_certain_amount_of_passwords == false) {
		text_area->setProperty("text", QString(generate_one_password(all_symbols,dist,gen,final_numbers,final_symbols, final_uppercase,final_lowercase).c_str()));
	}
	else {
		string passwords;
		srand(time(NULL));
		for (int i = 0; i < number_of_passwords; i++) {

			passwords += generate_one_password(all_symbols, dist, gen, final_numbers, final_symbols, final_uppercase, final_lowercase); 
			if (!(number_of_passwords-1 == i))
				passwords += '\n';
		}
		text_area->setProperty("text", QString(passwords.c_str()));
	}
	
	if (is_savetofile) {
		wstring path = file_name->property("text").toString().toStdWString();

		HANDLE file = CreateFileW(path.c_str(), GENERIC_WRITE, NULL, NULL, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
		qDebug() << path;
		if (file == INVALID_HANDLE_VALUE) {
			qDebug() << "not ok";
		}
		string buffer = text_area->property("text").toString().toStdString();
		DWORD bytesWritten;
		WriteFile(file, buffer.c_str(), buffer.size(), &bytesWritten, NULL);
		CloseHandle(file);
	}

	
}

Q_INVOKABLE void Backend::copy_button_pressed(QString text)
{

	CopyToClipboard(text.toStdString());
}

Q_INVOKABLE void Backend::get_minimum_and_maximum(QString min, QString max)
{
	minimum_password_length = min.toInt();
	maximum_password_length = max.toInt();
}

Q_INVOKABLE void Backend::get_password_length(QString length)
{
	password_length = length.toInt();
}

Q_INVOKABLE void Backend::get_passwords_number(QString number)
{
	number_of_passwords = number.toInt();
}

void Backend::CopyToClipboard(const std::string& text) {
	// Открываем буфер обмена
	if (!OpenClipboard(nullptr))
		return;

	// Очищаем буфер
	EmptyClipboard();

	// Выделяем глобальную память под текст + нулевой символ
	HGLOBAL hGlob = GlobalAlloc(GMEM_MOVEABLE, text.size() + 1);
	if (!hGlob) {
		CloseClipboard();
		return;
	}

	// Копируем текст в выделенную память
	memcpy(GlobalLock(hGlob), text.c_str(), text.size() + 1);
	GlobalUnlock(hGlob);

	// Передаём память буферу обмена
	SetClipboardData(CF_TEXT, hGlob);

	// Закрываем буфер
	CloseClipboard();
}

std::string Backend::generate_one_password(std::string all_symbols, std::uniform_int_distribution<> dist, std::mt19937 gen, string digits, string symbols, string uppercase, string lowercase)
{
	
	std::string password;
	if (is_numbers_enabled and !digits.empty()) password += digits[rand() % digits.size()];
	if (is_symbols_enabled and !symbols.empty()) password += symbols[rand() % symbols.size()];
	if (is_uppercasecharacters_enabled and !uppercase.empty()) password += uppercase[rand() % uppercase.size()];
	if (is_lowercasecharacters_enabled and !lowercase.empty()) password += lowercase[rand() % lowercase.size()];

	gen.seed(std::random_device{}());
	int pass_length;
	if (is_certain_amount_of_passwords) {
		dist = std::uniform_int_distribution<int>(minimum_password_length, maximum_password_length);
		pass_length = dist(gen);
		qDebug() << minimum_password_length << " " << maximum_password_length;
	}
	else {
		pass_length = password_length;
	}
	

	if (password.size() > pass_length) {
		shuffle(password.begin(), password.end(), mt19937(random_device()()));
		password.erase(password.begin() + pass_length);
	}
	if (password.size() < pass_length) {
		dist = std::uniform_int_distribution<int>(0, all_symbols.size() - 1);
		int temp = pass_length - password.size();
		for (int i = 0; i < temp; i++) {
			password += all_symbols[dist(gen)];
		}
		shuffle(password.begin(), password.end(), mt19937(random_device()()));
	}
	

	
	return password;
}
