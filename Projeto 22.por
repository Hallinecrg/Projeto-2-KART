programa
{
	inclua biblioteca Texto --> Altenativas

	funcao inteiro Continua (inteiro Cadastrar ,inteiro Inicio)
	{ 
		inteiro menos = Inicio - Inicio
		
		se(Cadastrar>0)
		{
			Inicio = Inicio + (1 + menos)
			 retorne Inicio
		}
		se(Cadastrar==0)
		{
			Inicio = Inicio - ( 15 - Inicio)
			
		}
		retorne Inicio
	}

     funcao cadeia ModeloAlugar (cadeia modelo)
     {
     	cadeia opcao, alugado = "Disponivel"
     	inteiro AlugarModelo
     	escreva("Deseja realmente alugar o modelo?(Digite sim ou aperte enter para não) ")
     	leia(opcao)

     	AlugarModelo = (Altenativas.numero_caracteres(opcao))

     	se(AlugarModelo > 0)
     	{
     		alugado = "Alugado"
     	}

     	retorne alugado
     }

     funcao cadeia ModeloDevolver (cadeia modelo)
     {
     	cadeia opcao, alugado = "Alugado"
     	inteiro DevolverModelo
     	escreva("Deseja realmente alugar o modelo?(Digite sim ou aperte enter para não) ")
     	leia(opcao)

     	DevolverModelo = (Altenativas.numero_caracteres(opcao))

     	se(DevolverModelo > 0)
     	{
     		alugado = "Disponivel"
     	}

     	retorne alugado
     }

     funcao real CalcularValor (real Preco, real Total)
     {
     	real Calcular

     	Calcular = Preco + Total

     	retorne Calcular
     }
    
	funcao inicio()
	{
	    inteiro Quantidade[15]
	    real Preco = 0.0, Total = 0.0, ValorTotal[15], Valor[15]
	    inteiro Cadastrar = 1, Alugar = 1, Inicio = 0, Sim, Devolver
	    cadeia opcao = "Sim", Alugado[15], kart[15], Kart, alugado, modelo


		
		 escreva("Deseja cadastrar um kart? (Digite sim ou aperte entre para não)\n")
		 leia(opcao)

		 Cadastrar = (Altenativas.numero_caracteres(opcao))
          enquanto (Cadastrar>0)
		{
			
		 se(Cadastrar>0)
		 {
			enquanto (Inicio>=0 e Inicio<14)
		     { 
		      escreva("Digite o modelo do kart que deseja cadastrar\n")
			 leia(Kart)
		 	
		 	 kart[Inicio] = Kart

		 	 escreva("Informe o valor do aluguel desse kart\n")
		 	 leia(Preco)

		 	 Valor[Inicio] = Preco


		 	 escreva("Deseja adicionar mais um kart? (Digite sim ou aperte entre para não)\n")
		 	 leia(opcao)

		 	 alugado = "Disponivel"
		 	 
		 	 Alugado[Inicio] = alugado

		 	 Cadastrar = (Altenativas.numero_caracteres(opcao))

		 	 Inicio = Continua(Cadastrar, Inicio)

		 	 
		     }
		 }
		
			
           se(Cadastrar==0)
           {
          	enquanto(Alugar>0)
          	{
          	escreva("Deseja alugar um kart? (Digite sim ou aperta enter para não)\n")
          	escreva("Ou deseja listar os karts disponiveis? (Digite listar karts disponiveis)\n")
          	escreva("Ou deseja listar os karts alugados? (Digite listar karts alugados)\n")
          	leia(opcao)

		     Alugar = (Altenativas.numero_caracteres(opcao))

		      para(Inicio=0; Inicio<14; Inicio++)
		      {
		      	escreva("\nExibir Krats")

		      	escreva(":", kart[Inicio],"\n")
                    escreva("", Valor[Inicio],"\n")
                    escreva("", Alugado[Inicio], "\n")
                    escreva("Esse modelo você gostaria de alugar? (Digite sim ou aperte enter para não)\n")
		          leia(modelo)


		          Sim = Altenativas.numero_caracteres(modelo)

                    se(Sim>0)
                    {
		           Alugado[Inicio] = ModeloAlugar(modelo)
		           ValorTotal[Inicio] = CalcularValor(Preco, Total)
                    }
		      	
		      }

		       para(Inicio=0; Inicio<14; Inicio++)
		       {
		      	 escreva("\nExibir Krats")

		      	 escreva(":", kart[Inicio], "\n")
		      	 escreva("", Valor[Inicio], "\n")
		      	 escreva("", Alugado[Inicio], "\n")

		      	 
		       }
		     
          	}
          	
           }
            
		}
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3608; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */