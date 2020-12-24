# Cronograma

*Cronogramas serão utilizados para definir um ou mais períodos para a execução de uma tarefa.*

Em ordem cronológica, eles são o Futuro, de forma que as Etapas se tornam Presente e o Passado.

#### Atributos

- **Tipo**: Define o tipo de cronograma.

- **Inicio**: Determina a data de inicio do cronograma.
- **Fim**: Determina a data de fim do cronograma.
- **Anterior**: O cronograma anterior, desta mesma tarefa.
- **Próximo**: O próximo cronograma desta mesma tarefa.

**Modo de Uso**

```sh
- Único
- Múltiplo
```

**Tipos** (Fixos do Sistema)

* **Tarefa**: Define o período prevista da execução de uma tarefa.
  * Não pode sobrepor o período de outro cronograma na mesma tarefa.
* **Usuário**: Define o período prevista da execução de uma tarefa para o usuário. 
  * Deve estar dentro do período de execução da tarefa.
  * Só pode estar vinculado à um usuário.