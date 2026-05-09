import random
import string
import os
import re 
import time
import sys

def generate_passwords(minS1, maxS1, count1, name):
    try:
        chooseU = str(input("Add uppercase symbols? (y/n) "))
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")

        chooseL = str(input("Add lowercase symbols? (y/n) "))
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")

        chooseN = str(input("Add numbers? (y/n) "))
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")

        chooseP = str(input("Add punctuation symbols? (y/n) "))
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")

        chooseWORD = str(input("Add special word/s? (y/n) "))
        if chooseWORD != "y":
            sys.stdout.write("\033[F") 
            sys.stdout.write("\033[K")
        
    except ValueError:
        print("Please, write correct answers!")

    passwords = set()
    characters = ""
    if chooseU == "y":
        characters += string.ascii_uppercase 
    if chooseL == "y":
        characters += string.ascii_lowercase
    if chooseN == "y":
        characters  += string.digits
    if chooseP == "y":
        characters += string.punctuation
      
    user_words = [] 
    end_word = ''
    if chooseWORD == "y":
        words = input("\tEnter a word/s (split by space): ")
        
        user_words = words.split(" ")

        begin_word = input("\tAdd your word/s in the beginning? (y/n) ")
        if begin_word == 'n':
            end_word = input("\tAdd your word/s in the end? (y/n) ")
            sys.stdout.write("\033[F") 
            sys.stdout.write("\033[K")
            time.sleep(0.5)
        
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")
        print("Add specific symbols to passwords? (y/n) ")
        time.sleep(0.5)  
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")

        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")
             
        print("Add specific symbols to passwords? (y/n) ")
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")
        time.sleep(0.5) 
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")
          
    else:
        user_words = []       


    chooseSC = input("\rAdd specific symbols to passwords? (y/n) ") 
    if chooseSC != "y":
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")

    if chooseSC == "y":
        symbol = input("\t" + "Write symbol/s (dont split): ")
        level = int(input("\t" + "How often do you want to see these characters in your password? (1-3): "))
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")
        print("Remove some characters from the generation? (y/n) ")
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")
       
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")
        time.sleep(0.5)
        print("Remove some characters from the generation? (y/n) ")
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")
        
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")
        time.sleep(0.5)
        sys.stdout.write("\r" + ' ' * 80)  
        sys.stdout.flush()
        if level == 1:
            for char in symbol:
                characters += char
        elif level == 2:
            for char in symbol:
                characters += char
                characters += char
                characters += char
                characters += char
        elif level == 3:
            for char in symbol:
                characters += char
                characters += char
                characters += char
                characters += char
                characters += char
                characters += char
    chooseR = input("\rRemove some characters from the generation? (y/n) ")
    if chooseR != "y":
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")
        
    if chooseR == "y":
        remove_list =  input("\tEnter characters that will not be in the passwords (dont split): ")
        pattern = f"[{re.escape(remove_list)}]"
        characters = re.sub(pattern, "", characters)
        time.sleep(0.5)
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")
        print("\rGenerating passwords.")
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")

        print("\rGenerating passwords..")
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")
    
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")
        time.sleep(0.5)
    else:
        pass
    GenPas = ["Generating passwords", "Generating passwords.", "Generating passwords..", "Generating passwords..."]
    for g in GenPas:
        message1 = g
        sys.stdout.write("\r" + '' * 80)  
        sys.stdout.write(message1)  
        sys.stdout.flush()
        time.sleep(0.5) 
    sys.stdout.write("\r" + ' ' * 80)  
    sys.stdout.flush()
    i = 0
    start_time = time.time()
    while len(passwords) < count1:
        randomN = random.randint(minS1, maxS1)
        password = ''.join(random.choice(characters) for _ in range(randomN))
        if password == '':
            print("\nYou didnt choose any of settings. Goodbye!")
            sys.stdout.flush()
            exit() 
        
        if user_words:
            word2 = random.choice(user_words)
            if len(user_words) == 1:
                word = user_words[0]
            else:
                word = random.choice(user_words)
                
            if len(word) >= minS1:
                print("\rYour word is equal or bigger then length of passwords")
                exit()

            insert_pos = random.randint(0, len(password) - len(word))
            password = password[:insert_pos] + word + password[insert_pos + len(word):]

            if begin_word == "y":
                insert_pos = random.randint(len(password) - len(word), randomN - len(word))
                password = word + password[:insert_pos]

            if end_word == "y":
                insert_pos = len(password) - len(word)
                password = password[:insert_pos] + word

            if len(word) + len(word2) < maxS1 and word2 != word:
                insert_pos = random.randint(0, len(password) - len(word) - len(word2))
                password = password[:insert_pos] + word + password[insert_pos + len(word) + len(word2):] + word2
        
        progress = (i + 1) / count1
        percentage = int(progress * 100)  # Преобразуем в проценты
        print("\r" + f"Progress: {percentage}% ({i+1}/{count1})", end="\r")
        sys.stdout.flush()  
        
        passwords.add(password)
       # sys.stdout.write("\r" + ' ' * 80 + "\r")
       # sys.stdout.flush()
        
        i+= 1
    sys.stdout.write("\r" + ' ' * 80 + "\r")
    sys.stdout.flush() 

    end_time = time.time() 
    execution_time = end_time - start_time
    print("\rExecution time: ", round(execution_time, 1), "s")
    passwords_text = '\n'.join(passwords)
    
    passwd_size = len(passwords_text.encode('utf-8'))
    passwd_size_kb = passwd_size /1024
    if passwd_size_kb > 1024:
        sys.stdout.flush()
        print("\rSize of file in mb: ", round(passwd_size_kb /1024, 1), "MB")
        chooseKB = input("\rAre you sure you want to continue? (y/n) ")

        if chooseKB != "y":
            print("Operation cancelled")
            sys.stdout.flush()
            return 0
    
    with open(name + ".txt", "w") as f: 
        for password in passwords:
            f.write(password + "\n")
            
    cur_dir = os.getcwd()
    print("\r" + "Done! Your file saved at:", cur_dir)


try:
    chooseSAMPLE = str(input("\rUse a template? (y/n) "))
    sys.stdout.write("\033[F") 
    sys.stdout.write("\033[K")
except:
    print("\rYou're trying to write incorrect answer!")
    exit()


def print_random_numbers(password, delay=0.12):
    message = password
    sys.stdout.write("\r" + '' * 80)  # Очистка текущей строки
    sys.stdout.write("\r" + message)  # Печать нового сообщения
    sys.stdout.flush()
    time.sleep(delay)  # Задержка перед следующим сообщением

random.seed(time.time())
def sample():
    passwords = set()
    temp1 = random.choice("PLUN")
    temp2 = random.choice("PLUN")
    temp3 = random.choice("PLUN")
    temp4 = random.choice("PLUN")

    print("\t" + "Write sample ")
    print("\tN - numbers, U - uppercase symbols, L - lowercase symbols, P - punctuation symbols")
    try:
        write_sample = input("\t" + f"For example '{temp1}{temp2}{temp3}{temp4}': ")
    except:
        print("\nYou're trying to write incorrect answer!")
        exit()
    sys.stdout.write("\033[F") 
    sys.stdout.write("\033[K")
    time.sleep(0.5)
    print("Enter number of lines: ")
    sys.stdout.write("\033[F") 
    sys.stdout.write("\033[K")
    sys.stdout.write("\033[F") 
    sys.stdout.write("\033[K")
    time.sleep(0.5)
    print("Enter number of lines: ")
    sys.stdout.write("\033[F") 
    sys.stdout.write("\033[K")
    time.sleep(0.5)
    sys.stdout.write("\033[F") 
    sys.stdout.write("\033[K")
    print("Enter number of lines: ")
    sys.stdout.write("\033[F") 
    sys.stdout.write("\033[K")
    time.sleep(0.5)

    
    if not("P" in write_sample) and not("N" in write_sample) and not("L" in write_sample) and not("U" in write_sample):
        print("Please, enter \"P\" or \"N\" or \"L\" or \"U\"")
        exit()
    try:
        count = int(input("Enter number of lines: "))
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")
        name = str(input("Enter name of file: "))
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")
    except:
        print("\rYou're trying to write incorrect answer!")
        exit()
    g = 0
    start_time = time.time()
    passwords_text = '\n'.join(passwords)
    passwd_size = len(passwords_text.encode('utf-8'))
    passwd_size_kb = passwd_size /1024
    
    while len(passwords) < count:
        temp_password = write_sample
        for char in write_sample:
            while char in temp_password:
                if char == "P":
                    temp_password = temp_password.replace(char, random.choice(string.punctuation), 1)
                elif char == "L":
                    temp_password = temp_password.replace(char, random.choice(string.ascii_lowercase), 1)
                elif char == "N":
                    temp_password = temp_password.replace(char, random.choice(string.digits), 1)
                elif char == "U":
                    temp_password = temp_password.replace(char, random.choice(string.ascii_uppercase), 1)
        
        g+=1
        progress = (g + 1) / count
        percentage = int(progress * 100)  # Преобразуем в проценты
        try:
            print(f"Progress: {percentage}% ({g+1}/{count})", end="\r")
        except:
            print("\rYou're trying to write incorrect answer!")
            exit()
        print_random_numbers(temp_password, 0)
        if percentage == 100:
            break
        passwords.add(temp_password)
    
    sys.stdout.write("\r" + ' ' * 80 + "\r")
    sys.stdout.flush()
    end_time = time.time()
    execution_time = end_time - start_time
    print("\rExecution time: ", round(execution_time, 1), "s")  
    if passwd_size_kb > 1024:
        print("Size of file in mb: ", round(passwd_size_kb /1024, 1), "MB")
        chooseKB = input("Are you sure you want to continue? (y/n) ")
        if chooseKB != "y":
            print("Operation cancelled")
            return 0
    with open(name + ".txt", "w") as f: 
        for write_sample in passwords:
            f.write(write_sample + "\n")

    cur_dir = os.getcwd()
    print("Done! Your file saved at:", cur_dir)

def asks():
    try: 
        minS = int(input("Specify minimum characters for each line: "))
        sys.stdout.write("\033[F")  # Перемещаем курсор вверх
        sys.stdout.write("\033[K")

        maxS = int(input("Specify maximum characters for each line: "))
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")

        count = int(input("Enter number of lines: "))
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")

        name = str(input("Enter name of file: "))
        sys.stdout.write("\033[F") 
        sys.stdout.write("\033[K")

        if __name__ == "__main__":
            generate_passwords(minS, maxS, count, name)
    except:
        print("\rYou're trying to write incorrect answers!                                     ")


if chooseSAMPLE == "y":
    sample()
else:
    asks()

