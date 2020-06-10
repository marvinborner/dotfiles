#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void print_help()
{
	printf("Help\n");
	exit(1);
}

int main(int argc, char *argv[])
{
	if (argc == 2 && (strcmp(argv[1], "--help") == 0))
		print_help();

	printf("Hello, world!\n");
	return 0;
}
