#pragma once
#include <QObject>
#include <QString>
#include <vector>
#include <Windows.h>
#include <QTimer>
#include <random>
#include <string>


using namespace std;


class Backend : public QObject
{
	Q_OBJECT
public:
	void setRoot(QObject* root);
	Q_INVOKABLE void enable_symbols(bool checked);
	Q_INVOKABLE void enable_numbers(bool checked);
	Q_INVOKABLE void enable_lowercase(bool checked);
	Q_INVOKABLE void enable_uppercase(bool checked);
	Q_INVOKABLE void exclude_similarcharacters(bool checked);
	Q_INVOKABLE void exclude_ambigiouscharacters(bool checked);
	Q_INVOKABLE void enable_savetofile(bool checked);
	Q_INVOKABLE void enable_certain_amount_of_passwords(bool checked);
	Q_INVOKABLE void button_pressed();
	Q_INVOKABLE void copy_button_pressed(QString text);
	Q_INVOKABLE void get_minimum_and_maximum(QString min, QString max);
	Q_INVOKABLE void get_password_length(QString length);
	Q_INVOKABLE void get_passwords_number(QString number);
	void CopyToClipboard(const std::string& text);
	std::string generate_one_password(std::string all_symbols, std::uniform_int_distribution<> dist, std::mt19937 gen, string digits, string symbols, string uppercase, string lowercase);





private:
	QObject* m_root = nullptr;
	QObject* text_area = nullptr;
	QObject* file_name = nullptr;
	bool is_symbols_enabled;
	bool is_lowercasecharacters_enabled;
	bool is_uppercasecharacters_enabled;
	bool is_numbers_enabled;
	bool is_similarcharacters_excluded;
	bool is_ambigiouscharacters_excluded;
	bool is_savetofile;
	bool is_certain_amount_of_passwords;
	int number_of_passwords;
	int minimum_password_length;
	int maximum_password_length;
	int password_length;
	std::string uppercase_letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	std::string lowercase_letters = "abcdefghijklmnopqrstuvwxyz";
	std::string digits = "0123456789";
	std::string symbols = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
	std::string similar_symbols = "iI1lo0O!|";
	std::string ambigious_symbols = "{}[]()/\\\"\'.:;,<>~`^|";
	
};

