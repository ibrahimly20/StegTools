import argparse
from steg_tools.steg_automate import StegAutomate

def process_strings_analysis(options):
    steg_automate = StegAutomate(options)
    steg_automate.run()

def ask_options(options):
    if options['file'] is None:
        options['file'] = input("What is the file to analyze path? (/path/to/file): ")

    if options['text_to_search'] is None:
        answer = input("What is the flag starting pattern? (default: 'picoCTF{'): ")
        options['text_to_search'] = 'picoCTF{' if not answer else answer

    if options['pattern'] is None:
        answer = input("What is the char that delimits the end of the flag? (default: '}'): ")
        options['pattern'] = '}' if not answer else answer

def main():
    parser = argparse.ArgumentParser(description="Stegano Tool")
    parser.add_argument("-f", "--file", help="File to analyze")
    parser.add_argument("-t", "--text", help="Flag starting pattern (e.g., 'picoCTF{')")
    parser.add_argument("-p", "--pattern", help="Char that delimits the end of the flag")
    args = parser.parse_args()

    options = {
        'file': args.file,
        'text_to_search': args.text,
        'pattern': args.pattern,
    }

    print("\n")
    print("**************************************************************************")
    print("**************************************************************************")
    print("**     ####    #####  ######   ####    #####   ####    ####   #         **")
    print("**   #          #    #       #    #     #    #    #  #    #  #          **")
    print("**    ####      #    #####   #          #    #    #  #    #  #          **")
    print("**        #     #    #       #  ###     #    #    #  #    #  #          **")
    print("**   #    #     #    #       #    #     #    #    #  #    #  #          **")
    print("**    ####      #    ######   ####      #     ####    ####   ######     **")
    print("**                                                                      **")
    print("**                Welcome to my custom stegano tool                     **")
    print("**************************************************************************")
    print("**************************************************************************")
    print(f"Made by: fulanypwn3r")
    print("Date: 23/11/2023")
    print("\n")
    print("Here are our available tools:")
    print("\t1. String Analysis")
    print("\n")
    answer = input("Do you want to perform a strings analysis? (y/n): ").lower()

    if answer == 'y':
        ask_options(options)
        print("[+] Processing...")
        process_strings_analysis(options)
    else:
        print("Exiting.")

if __name__ == "__main__":
    main()
