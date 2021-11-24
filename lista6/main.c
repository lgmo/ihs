#include <stdio.h>

extern void sort(int v[], int n);

int main() {
    int n;
    int v[10];

    printf("Digite o tamanho do vetor: ");
    scanf("%d", &n);
    printf("Digite os elementos do vetor em ordem: ");
    for(int i=0; i < n; i++) {
        scanf("%d", &v[i]);
    }

    sort(v, n);

    printf("Vetor ordenado: ");    
    for(int i=0; i<n; i++) {
        if(i == n - 1) {
            printf("%d\n", v[i]);
        }
        else{
            printf("%d ", v[i]);
        }
    }
}
