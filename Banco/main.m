
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    int qtdClientes = 0;
    int qtdCaixas = 0;
    int momentoEntrouNaFila = 0;
    int duracaoAtendimento = 0;
    int caixaIndex = 0;
    int qtdEstourouTempoLimite = 0;
    
    //NSLog(@"Informe a quantidade de clientes: ");
    printf("Informe a quantidade de clientes: ");
    scanf("%i", &qtdClientes);
    
    printf("Informe a quantidade de caixas: ");
    scanf("%i", &qtdCaixas);
    
    int caixas[qtdCaixas];
    
    //Zera o tempo total de atendimento dos caixas
    for (int k = 0; k < qtdCaixas; k++) {
        caixas[k] = 0;
    }
    
    //Varre os clientes para adicionar o dicionário de cliente
    for (int i = 0; i < qtdClientes; i++) {
        //Insere as informações do cliente
        printf("Informe o momento em que o cliente entrou na fila: ");
        scanf("%i", &momentoEntrouNaFila);
        
        printf("Informe o tempo gasto no atendimento ao cliente: ");
        scanf("%i", &duracaoAtendimento);
        
        int tempoTotal = caixas[caixaIndex];
        int tempoEspera = 0;
        
        //Calcula quanto tempo o cliente esperou para ser atendido
        tempoEspera = tempoTotal - momentoEntrouNaFila;
        
        //Calcula o tempo total decorrido desde a abertura do caixa
        tempoTotal += duracaoAtendimento;
        
        //Seta o novo tempo total de atendimento
        caixas[caixaIndex] = tempoTotal;
        
        //Verifica se o tempo de espera estourou o limite de tempo
        if (tempoEspera > 20) {
            qtdEstourouTempoLimite ++;
        }
        
        //Verifica qual caixa será o próximo a atender
        for (int c = 0; c < qtdCaixas; c++) {
            
            int tempo = caixas[c];
            
            if (tempo < tempoTotal) {
                caixaIndex = c;
            }
        }
        
    }
    
    printf("\n\n");
    NSLog(@"Quantidade de clientes atendidos acima do tempo limite :%i", qtdEstourouTempoLimite);
    
    return 0;
}