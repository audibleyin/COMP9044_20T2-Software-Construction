// Written by andrewt@cse.unsw.edu.au as COMP2041 lecture example

/*
 * word_frequency0.c  with linked list replaced by binary tree - much faster:
 *
 * % gcc -O3 word_frequency1.c -o word_frequency1
 * % time word_frequency1 <WarAndPeace.txt >/dev/null
 * real    0m0.277s
 * user    0m0.268s
 * sys     0m0.008s
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
       struct map_tnode *tree;
};

struct map_tnode {
       char             *key;
       void             *value;
       struct map_tnode *smaller;
       struct map_tnode *larger;
};

map *
create_map() {
    struct map *m;
    if ((m = malloc(sizeof *m)) == NULL) {
        fprintf(stderr, "Out of memory\n");
        exit(1);
    }
    m->size = 0;
    m->tree = NULL;
    return m;
}

/*
 * Return the value associated with key in map m.
 */
static void *
get_tree(struct map_tnode *t, char *key) {
    int compare;
    if (t == NULL)
        return NULL;
    compare = strcmp(key, t->key);
    if (compare == 0)
        return t->value;
    else if (compare < 0)
        return get_tree(t->smaller, key);
    else
        return get_tree(t->larger, key);
}

void *get(map *m, char *key) {
    return  get_tree(m->tree, key);
}

/*
 * Return the value associated with key in map m.
 */
struct map_tnode *
put_tree(struct map_tnode *t, char *key, void *value, map *m) {
    int compare;
    if (t == NULL) {
        if ((t = malloc(sizeof *t)) == NULL) {
            fprintf(stderr, "Out of memory\n");
            exit(1);
        }
        t->key = key;
        t->value = value;
        t->smaller = NULL;
        t->larger = NULL;
        m->size++;
        return t;
    }

    compare = strcmp(key, t->key);
    if (compare == 0) {
        t->value = value;
    } else if (compare < 0)
        t->smaller = put_tree(t->smaller, key, value, m);
    else
        t->larger = put_tree(t->larger, key, value, m);
    return t;
}

void
put(map *m, char *key, void *value) {
    m->tree = put_tree(m->tree, key, value, m);
}

int
size(map *m) {
    return m->size;
}

static int
tree_to_array(struct map_tnode *t, char **key_array, int index) {
    if (t == NULL)
        return index;
    index = tree_to_array(t->smaller, key_array, index);
    key_array[index] = t->key;
    return tree_to_array(t->larger, key_array, index + 1);
}

char **keys(map *m) {
    char **key_array;

    if ((key_array = malloc(size(m)*sizeof (char **))) == NULL) {
        fprintf(stderr, "Out of memory\n");
        exit(1);
    }
    tree_to_array(m->tree, key_array, 0);
    return key_array;
}

static void
free_tnodes(struct map_tnode  *t) {
    if (t == NULL)
        return;
    free_tnodes(t->smaller);
    free_tnodes(t->larger);
    free(t);
}

void free_map(map *m) {
    free_tnodes(m->tree);
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
