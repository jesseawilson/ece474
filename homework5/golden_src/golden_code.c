/*
 * Name: golden_code.c
 */

#include <stdio.h>

#define INPUT_PATH "./vectors/input_data"
#define OUTPUT_PATH "./vectors/golden_data"

int main(int argc, char **argv) 
{
	FILE *input;
	FILE *output;
	int a_in;
	int b_in; 
	int a; 
	int b; 
	int temp;
	
	if((input = fopen(INPUT_PATH, "r")) == NULL) {
		printf("failed to open input file\n");
		return -1;
	}
      
	if((output = fopen(OUTPUT_PATH, "w")) == NULL) {
		printf("failed to open output file\n");
		return -1;
	}
	
	while(fscanf(input, "%d %d", &a_in, &b_in) > 0) {
		a = a_in;
		b = b_in;

		while(b != 0) {
			if(a < b) {
				temp = a;
				a = b;
				b = temp;
			}
			else {
				a = a - b;
			}
		}
              
		fprintf(output, "a_in: %10d   b_in: %10d   result: %10d\n", 
			a_in, b_in, a);
	}
      
	fclose(input);
	fclose(output);
      
	return 0;
}

