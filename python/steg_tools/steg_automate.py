import subprocess

class StegAutomate:
    def __init__(self, options):
        self.options = options
        self.strings_result = None

    def search_strings(self):
        self.strings_result = str(subprocess.check_output(['strings ' + self.options['file']], stderr=subprocess.STDOUT, shell=True))

    def file_contains_string(self):
        return self.options['text_to_search'] in self.strings_result

    def index_of_pattern(self):
        return self.strings_result.find(self.options['text_to_search'])

    def index_of_delimiter(self, start):
        new_string = self.strings_result[start:]
        return new_string.find(self.options['pattern']) + start + 1

    def search_for_specific_string(self):
        start = self.index_of_pattern()
        if self.file_contains_string():
            return self.strings_result[start:self.index_of_delimiter(start)]

    def run(self):
        self.search_strings()
        result = self.search_for_specific_string()
        print("[x] flag not found !!!" if result is None else f"[+] the flag is : {result}")