// Written by andrewt@cse.unsw.edu.au as COMP2041 lecture example

/*
 * Written in C for "speed" but slow on large inputs:
 *
 * % gcc -O3 -o word_frequency0  word_frequency0.c
 * % time word_frequency0 <WarAndPeace.txt >/dev/null
 * real    0m52.726s
 * user    0m52.643s
 * sys     0m0.020s
 */

/*
 * Profiling with gprof revels get function is problem
 *
 * gcc -p -g word_frequency0.c -o word_frequency0_profile
 * head -10000 WarAndPeace.txt|word_frequency0_profile >/dev/null
 * % gprof word_frequency0_profile
  %   cumulative   self              self     total
 time   seconds   seconds    calls  ms/call  ms/call  name
 88.90      0.79     0.79    88335     0.01     0.01  get
  7.88      0.86     0.07     7531     0.01     0.01  put
  2.25      0.88     0.02    80805     0.00     0.00  get_word
  1.13      0.89     0.01        1    10.02   823.90  read_words
  0.00      0.89     0.00        2     0.00     0.00  size
  0.00      0.89     0.00        1     0.00     0.00  create_map
  0.00      0.89     0.00        1     0.00     0.00  keys
  0.00      0.89     0.00        1     0.00     0.00  sort_words
....
 */

#include <stdlib.h>
#include "time.h"
#include <string.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/*
 * returns the next word from the streeam
 * a word is a non-zero length sequence of
 * alphabetic characters
 *
 * NULL is returned if there are no more words to be read
 */
char *
get_word(FILE *stream) {
    int i, c;
    char *w;
    static char *buffer = NULL;
    static int buffer_length = 0;

    if (buffer == NULL) {
        buffer_length = 32;
        buffer = malloc(buffer_length*sizeof (char));
        if (buffer == NULL) {
            fprintf(stderr, "out of memory\n");
            exit(1);
        }
    }

    i = 0;
    while ((c = fgetc(stream)) != EOF) {
        if (!isalpha(c) && i == 0)
            continue;
        if (!isalpha(c))
            break;
        if (i >= buffer_length) {
            buffer_length += 16;
            buffer = realloc(buffer, buffer_length*sizeof (char));
            if (buffer == NULL) {
                fprintf(stderr, "out of memory\n");
                exit(1);
            }
        }
        buffer[i++] = c;
    }

    if (i == 0)
        return NULL;

    buffer[i] = '\0';

    w = malloc(strlen(buffer) + 1);
    if (w == NULL) {
        fprintf(stderr, "out of memory\n");
        exit(1);
    }
    strcpy(w, buffer);
    return w;
}

typedef struct map  map;

struct map {
       int              size;
       struct map_node  *list;
};

struct map_node {
       char             *key;
       void             *value;
       struct map_node  *next;
};


map *
create_map() {
    struct map *m;
    if ((m = malloc(sizeof *m)) == NULL) {
        fprintf(stderr, "Out of memory\n");
        exit(1);
    }
    m->size = 0;
    m->list = NULL;
    return m;
}

void *get(map *m, char *key) {
    struct map_node *v;
    for (v = m->list; v != NULL; v = v->next) {
        if (strcmp(key, v->key) == 0) {
            return v->value;
        }
    }
    return NULL;
}

void
put(map *m, char *key, void *value) {
    struct map_node *v;
    for (v = m->list; v != NULL; v = v->next) {
        if (strcmp(key, v->key) == 0) {
            v->value = value;
            return;
        }
    }

    if ((v = malloc(sizeof *v)) == NULL) {
        fprintf(stderr, "Out of memory\n");
        exit(1);
    }
    v->key = key;
    v->value = value;
    v->next = m->list;
    m->list = v;
    m->size++;
}

int
size(map *m) {
    return m->size;
}

char **keys(map *m) {
    struct map_node *v;
    int  i, n_keys = size(m);
    char **key_array;

    if ((key_array = malloc(n_keys*sizeof (char **))) == NULL) {
        fprintf(stderr, "Out of memory\n");
        exit(1);
    }
    for (v = m->list, i=0; v != NULL; v = v->next,i++)
        key_array[i] = v->key;
    return key_array;
}

static void
free_map_nodes(struct map_node  *list) {
    if (list == NULL)
        return;
    free_map_nodes(list->next);
    free(list);
}

void free_map(map *m) {
    free_map_nodes(m->list);
    free(m);
}
/*
 * One word_count struct is malloc'ed for each
 * distinct word read
 */
struct word_count {
    int count;
};

/*
 * read the words from a stream
 * associate a word_count struct with
 * each new word
 *
 * increment the count field each time the
 * word is seen
 */
map *
read_words(FILE *stream) {
    char *word;
    struct word_count *w;
    map *m;

    m = create_map();
    while (1) {
        word = get_word(stdin);
        if (word == NULL)
            return m;
        w = get(m, word);
        if (w != NULL) {
            w->count++;
            free(word);
            continue;
        }
        if ((w = malloc(sizeof *w)) == NULL) {
            fprintf(stderr, "Out of memory\n");
            exit(1);
        }
        w->count = 1;
        put(m, word, w);
    }
}

void
sort_words(char **sequence, int length) {
    int i, j;
    char *pivotValue;
    char *temp;

    if (length <= 1)
        return;

    /* start from left and right ends */

    i = 0;
    j = length - 1;

    /* use middle value as pivot */

    pivotValue = sequence[length/2];
    while (i < j) {

        /* Find two out-of-place elements */

        while (strcmp(sequence[i], pivotValue) < 0)
            i++;
        while (strcmp(sequence[j], pivotValue) > 0)
           j--;
        /* and swap them over */

        if (i <= j) {
            temp = sequence[i];
            sequence[i] = sequence[j];
            sequence[j] = temp;
            i++;
            j--;
        }
    }
    sort_words(sequence, j + 1);
    sort_words(sequence+i, length - i);
}
int
main(int argc, char *argv[]) {
    int i, n_unique_words;
    char **key_array;
    map *m;

    m = read_words(stdin);

    key_array = (char **)keys(m);

    n_unique_words = size(m);

    sort_words(key_array, n_unique_words);

    for (i = 0; i < n_unique_words; i++) {
        struct word_count *w;
        w = (struct word_count *)get(m, key_array[i]);
        printf("%5d %s\n", w->count, key_array[i]);
    }

    return 0;
}
