// Informações do estudante
// Nome: João Victor Mendes Freire
// Curso: BCC
// RA: 758943

#include <stdio.h>
#include <stdlib.h>

typedef struct pessoa Pessoa; 
struct pessoa 
{
    int posicao;
    Pessoa *prox; 
};

Pessoa *inicio = NULL;

void insereLista(int x)
{
    Pessoa *temp = (Pessoa *) malloc(sizeof(Pessoa));
    temp->posicao = x;
    temp->prox = NULL;

    if (inicio == NULL)
    {
        inicio = temp;
        inicio->prox = inicio;
    } else
    {
        Pessoa *tail = inicio;
        while (tail->prox != inicio)
            tail = tail->prox;

        temp->prox = inicio;
        tail->prox = temp;
    }
}

void removeLista(Pessoa *p)
{
    Pessoa *morta = p->prox;

    if (morta == inicio)
        inicio = morta->prox;

    p->prox = morta->prox;

    free(morta);
    morta = NULL;
}

void imprimeLista()
{
    if (inicio != NULL)
    {
        Pessoa *aux = inicio;

        do 
        {
            printf("%d ", aux->posicao);
            aux = aux->prox;
        } while (aux != inicio);

        printf("\n");
    }
    else
        printf("Lista vazia\n");
}

int resolveJosephus(int n, int m) 
{
    for (int i = 0; i < n; i++)
        insereLista(i + 1);

    Pessoa *assassino = inicio;
    while (assassino != assassino->prox)
    {
        int passos = m - 1;
        Pessoa *anterior_morta = assassino;
        while (passos > 0)
        {
            anterior_morta = anterior_morta->prox;
            passos--;
        }

        if (anterior_morta->prox == assassino)
            anterior_morta = assassino;

        removeLista(anterior_morta);
        assassino = anterior_morta->prox;
    }

    int s = inicio->posicao;
    free(inicio);
    inicio = NULL;
    return s;
}

int main(int argc, char** argv)
{
    int nroexecs;
    scanf("%d", &nroexecs);
    int *n = malloc(nroexecs * sizeof(int)); 
    int *p = malloc(nroexecs * sizeof(int));

    for(int i = 0; i < nroexecs; i++)
    {
        scanf("%d", &n[i]);
        scanf("%d", &p[i]);
    }
    for(int i = 0; i < nroexecs; i++)
        printf("Usando n=%d, m=%d, resultado=%d\n", n[i], p[i], resolveJosephus(n[i], p[i])); 
    
    return 0;
}