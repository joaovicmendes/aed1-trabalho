// Informações do estudante
// Nome: João Victor Mendes Freire
// Curso: BCC
// RA: 758943

#include <stdio.h>
#include <stdlib.h>

int rainhas(int n);

int main() { 
    int n;
    scanf("%d", &n);

    printf("%d\n", rainhas(n));
    return 0;
}  

int rainhas(int n) {
    int *col_rainha;
    int *col_livre;
    int *diagonal_livre; 
    int *diagonal_principal_livre;
    int *diagonal_secundaria_livre;
    int lin, col, k, solucoes;
    int acabou;
    int achou_posicao;

    col_livre = malloc(n * sizeof(int));
    diagonal_livre = malloc((2 * n - 1) * sizeof(int));
    diagonal_secundaria_livre = malloc((2 * n - 1) * sizeof(int));
    diagonal_principal_livre = diagonal_livre + n - 1;
    col_rainha = malloc(n * sizeof(int));

    for (k = 0; k < n; k++)
        col_livre[k] = 1;

    for (k = 0; k < 2 * n - 1; k++)  
        diagonal_livre[k] = diagonal_secundaria_livre[k] = 1;
  
    lin = 0;  
    col = 0; 
    solucoes = 0;  
    acabou = 0;
    while (!acabou)   {
        achou_posicao = 0;
        while (col < n && !achou_posicao)  { 
            if (col_livre[col] && diagonal_principal_livre[lin - col] 
                               && diagonal_secundaria_livre[lin + col]) {
                col_livre[col] = 0;
                diagonal_principal_livre[lin - col] = 0;
                diagonal_secundaria_livre[lin + col] = 0;
                col_rainha[lin] = col;
                achou_posicao = 1;
            }
            else
                col++;
        }
        if (achou_posicao)  {
            if (lin != n - 1)  { 
                lin++;
                col = 0;
            }
            else  {  
                solucoes++;
                col_livre[col] = 1;
                diagonal_principal_livre[lin - col] = 1;
                diagonal_secundaria_livre[lin + col] = 1;
                col = n;
            }
        }
        else  {
            if (lin == 0)
                acabou = 1;
            else  {
                lin--;
                col = col_rainha[lin];
                col_livre[col] = 1;
                diagonal_principal_livre[lin - col] = 1;
                diagonal_secundaria_livre[lin + col] = 1;
                col++;
            }
        }
    }
    free(col_rainha);
    free(col_livre);
    free(diagonal_livre);
    free(diagonal_secundaria_livre);

    return solucoes;
}
