#!/usr/bin/env python
import sys

if __name__ == "__main__":
    try:
        from django.core.management import execute_from_command_line
    except ImportError:
        # The above import may fail for some other reason. Ensure that the
        # issue is really that Django is missing to avoid masking other
        # exceptions on Python 2.
        try:
            import django  # noqa: F401
        except ImportError:
            raise ImportError(
                "Couldn't import Django. Are you sure it's installed and "
                "available on your PYTHONPATH environment variable? Did you "
                "forget to activate a virtual environment?"
            )
        raise
    execute_from_command_line(sys.argv.insert(1, "test"))

class Accumulator:

    @staticmethod
    # part 1
    def get_accumulator(data):
        accumulator = 0
        line = 0
        instructions = []

        # we don't want to get to the same line again as said in the instructions
        while line not in instructions:
            instructions.append(line)

            # get our first instructions and update the list everytime we traverse through the loop
            current_instruction = data[line].split()
            command, number = current_instruction[0], current_instruction[1]

            if "+" in number: # from list position is one
                number = int(number[1:]) # avoid the first character which is the plus sign
            else:
                number = int(number)

            if command == "acc":
                accumulator += number
                line += 1
            elif command == "jmp":
                line += number
            elif command == "nop":
                line += 1

        return accumulator

    @staticmethod
    def get_accumulator_ending(data):
        accumulator = 0
        line = 0
        instructions = []

        # we don't want to get to the same line again as said in the instructions
        while line not in instructions:
            instructions.append(line)

            # get our first instructions and update the list everytime we traverse through the loop
            current_instruction = data[line].split()
            command, number = current_instruction[0], current_instruction[1]

            if "+" in number: # from list position is one
                number = int(number[1:]) # avoid the first character which is the plus sign
            else:
                number = int(number)

            if command == "acc":
                accumulator += number
                line += 1
            elif command == "jmp":
                line += number
            elif command == "nop":
                line += 1

            if line >= len(data):
                return accumulator, True

        return accumulator, False
