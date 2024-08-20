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

     		retorne alugado
     	}

     	

     	se(AlugarModelo <= 0)
     	{
     		alugado = "Disponivel"
     	}
     	retorne alugado
     }

     funcao cadeia ModeloDevolver (cadeia Devolver)
     {
     	cadeia opcao, alugado = "Alugado"
     	inteiro DevolverModelo
     	escreva("Deseja realmente devolver o kart?(Digite sim ou aperte enter para não) ")
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

     funcao MostrarLivres (cadeia alugado, cadeia Kart, real Preco)
     {
     	inteiro Inicio
     	real Valor[15]
     	cadeia Alugado[15], kart[15]

     	para(Inicio = 0; Inicio < 14; Inicio++)
     	{
               Alugado[Inicio] = alugado
               
               kart[Inicio] = Kart

               Valor[Inicio] = Preco
     		
     	     escreva("\nExibir karts")

     	     escreva(":", kart[Inicio], "\n")
     	     escreva("", Valor[Inicio], "\n")
     	     escreva("", Alugado[Inicio], "\n")
     	}
     }

     funcao real Calcular30 (real Preco)
     {
     	real Soma

     	Soma = Preco + Preco * (30/100)

     	retorne Soma
     }

     funcao real Calcular70 (real Preco)
     {
     	real Soma

     	Soma = Preco + Preco * (70/100)

     	retorne Soma
     }
    
	funcao inicio()
	{
	    inteiro Quantidade[15]
	    real Preco = 0.0, Total = 0.0, ValorTotal[15], Valor[15], Calcular30Soma = 0.0, Calcular70Soma = 0.0
	    real Maior = 0.0
	    inteiro Cadastrar = 1, Alugar = 1, Inicio = 0, SimAlugar, Livres
	    inteiro Alugados, livres = 0,SimDevolver, quantidade = 0, tempo = 0, Tempo = 0
	    cadeia opcao = "Sim", Alugado[15], kart[15], Kart, alugado = "Disponivel", modelo = "Nome"
	    cadeia Devolver = "Nome", MaiorKart


		
		 escreva("Deseja cadastrar um kart? (Digite sim ou aperte entre para ir na área de locação)\n")
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
		}
		
			
           se(Cadastrar == 0)
           { 
           	
          	enquanto(Alugar>0)
          	{
          	escreva("Deseja alugar um kart? (Digite sim ou aperta enter para fechar o programa)\n")
          	escreva("Digite 'Listar Karts' para mostrar os karts disponiveis\n")
          	escreva("Ou deseja listar os karts alugados? (Digite listar karts alugados)\n")
          	leia(opcao)


		     Alugar = (Altenativas.numero_caracteres(opcao))

		     Livres = (Altenativas.numero_caracteres(opcao))

		     Alugados = (Altenativas.numero_caracteres(opcao))

		     se(Livres == 12 )
		     {
		     	para (Inicio = 0; Inicio < 14; Inicio++)
		     	{
		     		escreva("\nExibir Krats Disponiveis ")

		     		escreva(":", kart[Inicio], "\n")
		     		escreva(" ", Valor[Inicio], "\n")
		     		escreva(" ", Alugado[Inicio], "\n")
		     	}

		     se(Alugados == 14)
		     {
		     	para (Inicio = 0; Inicio < 14; Inicio++)
		     	{
		     	     escreva("\nExibir Krats Alugado ")

		     	     escreva(":", kart[Inicio], "\n")
		     	     escreva(" ", Valor[Inicio], "\n")
		     	     escreva(" ", Alugado[Inicio], "\n")
		     	}
		     }

		     	escreva("Deseja alugar um kart? (Digite sim ou aperta enter para não)\n")
		     	leia(opcao)

		     	Alugar = Altenativas.numero_caracteres(opcao)
		     }
               se(Alugar >=3)
               {
		      para(Inicio=0; Inicio<14; Inicio++)
		      {
		      	escreva("\nExibir Krats")

		      	escreva(":", kart[Inicio],"\n")
                    escreva("", Valor[Inicio],"\n")
                    escreva("", Alugado[Inicio], "\n")
                   
                    livres = (Altenativas.numero_caracteres(alugado))

                    se(livres == 10)
                    {
                       escreva("Esse modelo você gostaria de alugar? (Digite sim ou aperte enter para não)\n")
		             leia(modelo)

                       Tempo = (Altenativas.numero_caracteres(modelo))
		             
                    } 
                    se(livres == 7)
                    {
                       escreva("Esse modelo está alugado! Gostaria de devolver? ")
                       leia(Devolver)
                    }

                    se(Tempo > 0)
		          {
		            escreva("Quanto tempo vai ficar alugado?")
		            leia(tempo)
		          }

                    se(tempo == 2)
                    {
                    	Calcular30Soma = Calcular30(Preco)
                    }

                    se(tempo >= 3)
                    {
                    	Calcular70Soma = Calcular70(Preco)
                    }

                    SimDevolver = (Altenativas.numero_caracteres(Devolver))

		          SimAlugar = (Altenativas.numero_caracteres(modelo))

                    se(SimAlugar > 0)
                    {
		           Alugado[Inicio] = ModeloAlugar(modelo)
		           alugado = "Alugado"
		           ValorTotal[Inicio] = CalcularValor(Preco, Total)
		           
		           quantidade++
		           Quantidade[Inicio] = quantidade
		           
		           
		            se(tempo == 2)
		            {
		             ValorTotal[Inicio] = ValorTotal[Inicio] + Calcular30Soma
		            }

		            se(tempo >= 3)
		            {
		            	ValorTotal[Inicio] = ValorTotal[Inicio] + Calcular70Soma
		            }
                    }

                     se(SimDevolver > 0)
                     {
                    	Alugado[Inicio] = ModeloDevolver(Devolver)
                    	alugado = "Disponivel"
                     }

                     

                     se(Maior < Valor[Inicio])
                     {
                     	MaiorKart = kart[Inicio]
                     }
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
 * @POSICAO-CURSOR = 2639; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */