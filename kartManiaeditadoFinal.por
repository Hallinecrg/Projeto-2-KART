programa
{
	inclua biblioteca Util --> u

	funcao valorMaiorKart(cadeia kartMaior[], real kartValorM[], logico locacao[], inteiro VezesLocado[]){
		inteiro i, quantidadeAlocado = 0
		real valorAtual, maiorValor = 0.0
		cadeia kartM = " "

		
		para (i = 0; i < 15; i++){

			se (locacao[i] == verdadeiro){
				
				valorAtual = kartValorM[i]

				se (valorAtual > maiorValor){

					maiorValor = valorAtual
					quantidadeAlocado = VezesLocado[i]
					kartM = kartMaior[i]
				}
			}
		}
		escreva ("O kart que gerou mais ganhos neste dia foi:" + kartM + "\nO preço do kart é:R$", maiorValor)
		escreva ("\nA quantidade de vezes que ele foi alocado foi:", quantidadeAlocado)
	}
	
	funcao cadastrarKart(cadeia modelo[], real valor[], logico locado[]){
		inteiro i, cadastrado = 0

		escreva("\n-CADASTRAR KART-\n")
		
		para(i = 0; i < 15; i++){
			se(modelo[i] == "" e cadastrado == 0){
				escreva("\nDigite o modelo do Kart: ")
				leia(modelo[i])

				enquanto(modelo[i] == ""){
					escreva("\nVocê não digitou nada. Digite o modelo do Kart para continuar: ")
					leia(modelo[i])
				}

				escreva("\nDigite o valor de locação do Kart: ")
				leia(valor[i])

				enquanto(valor[i] < 0){
					escreva("\nO valor de locação não pode ser negativo. Digite um valor válido para continuar: ")
					leia(valor[i])
				}

				locado[i] = falso

				escreva("\nSeu Kart foi cadastrado com sucesso!\n\n")

				cadastrado = 1
			}
		}
	}

	funcao listarKartsDisponiveis(logico locado[], cadeia modelo[], real valor[], inteiro vezesLocado[]){
		inteiro i, kartNumero = 1, temDisponivel = 0

		escreva("\n-KARTS DISPONÍVEIS-\n")

		para(i = 0; i < 15; i++){
			se(modelo[i] != ""){
				escreva("\nKart ", kartNumero, ":\nModelo: ", modelo[i], "\nValor de locação: R$", valor[i])
				escreva("\nQuantidade de vezes que foi locado: ", vezesLocado[i])

				se(locado[i] == falso){
					escreva("\nEste Kart não está locado.\n")
				}senao{
					escreva("\nEste Kart está locado.\n")
				}
				
				kartNumero++

				temDisponivel = 1
			}
		}

		se(temDisponivel == 0){
			escreva("\nNão há nenhum Kart disponível no momento.\n")
		}
	}

	funcao listarKartsLocados(logico locado[], cadeia modelo[]){
		inteiro i, temLocado = 0

		escreva("\n-KARTS LOCADOS-\n")

		para(i = 0; i < 15; i++){
			se(locado[i]){
				escreva("\nKart ", modelo[i], "\n")
				
				temLocado = 1
			}
		}

		se(temLocado == 0){
			escreva("\nNão há nenhum Kart locado no momento.\n")
		}
	}

	funcao alugarUmKart(logico locado[], cadeia modelo[], inteiro quantidadeLocado[], real &receita, real valor[], real &lucro){
		inteiro i, numeroKart = 1, temDisponivel = 0, alugarKart, iDisponiveis[15], contaDisponiveis = 0
		real receitaKart

		escreva("\n-ALUGAR UM KART-\n")

		para(i = 0; i < 15; i++){
			se(locado[i] == falso e modelo[i] != ""){
				escreva("\n", numeroKart, ". ", modelo[i], "\n")

				iDisponiveis[contaDisponiveis] = i

				contaDisponiveis++

				numeroKart++

				temDisponivel = 1
			}
		}

		se(temDisponivel == 0){
			escreva("\nNão há nenhum Kart disponível para locação no momento.\n")
		}senao{
			escreva("\nDigite um valor referente ao Kart que deseja alugar: ")
			leia(alugarKart)

			enquanto(alugarKart < 1 ou alugarKart > contaDisponiveis){
				escreva("\nValor inválido. Digite um valor referente ao Kart que deseja alugar: ")
				leia(alugarKart)
			}

			inteiro indexReal = iDisponiveis[alugarKart - 1]

			locado[indexReal] = verdadeiro

			escreva("\nO Kart modelo ", modelo[indexReal], " foi alugado com sucesso!\n")

			receitaKart = valor[indexReal]

			receita = receita + receitaKart

			lucro = (30.0 / 100.0) * receitaKart

			quantidadeLocado[indexReal]++
		}
	}

	funcao devolverUmKart(logico locado[], cadeia modelo[]){
		inteiro i, numeroKart = 1, temLocado = 0, devolverKart, iDisponiveis[15], contaDisponiveis = 0

		escreva("\n-DEVOLVER UM KART-\n")

		para(i = 0; i < 15; i++){
			se(locado[i]){
				escreva("\n", numeroKart, ". ", modelo[i], "\n")

				iDisponiveis[contaDisponiveis] = i

				contaDisponiveis++

				numeroKart++

				temLocado = 1
			}
		}

		se(temLocado == 0){
			escreva("\nNão há nenhum Kart locado no momento.\n")
		}senao{
			escreva("\nDigite um valor referente ao Kart que deseja devolver: ")
			leia(devolverKart)

			enquanto(devolverKart < 1 ou devolverKart > numeroKart - 1){
				escreva("\nValor inválido. Digite um valor referente ao Kart que deseja devolver: ")
				leia(devolverKart)
			}

			inteiro indexReal = iDisponiveis[devolverKart - 1]

			locado[indexReal] = falso

			escreva("\nO Kart modelo ", modelo[indexReal], " foi devolvido com sucesso!\n")
		}
	}

	funcao cadastrarCircuito(cadeia circuito[], real preco[], logico locado[])
	{
		inteiro i, cadastrados = 0

		escreva("\n-CADASTRADAR CIRCUITO-\n")

		para(i = 0; i < 15; i++)
		{
			se(circuito[i] == "" e cadastrados == 0)
			{
			  escreva("\nDigite o circuito: ")
		       leia(circuito[i])

				enquanto(circuito[i] == ""){
					escreva("\nVocê não digitou nada. Digite o circuito para continuar: ")
					leia(circuito[i])
				}

				escreva("\nDigite o valor de locação do Circuito: ")
				leia(preco[i])

				enquanto(preco[i] < 0){
					escreva("\nO valor de locação não pode ser negativo. Digite um valor válido para continuar: ")
					leia(preco[i])
				}

				locado[i] = falso

				escreva("\nSeu Circuito foi cadastrado com sucesso!\n\n")

				cadastrados = 1
			}
		}
	}

	funcao AlugarCircuito (logico locado[], cadeia circuito[], real &receita, real valor[], real &lucro)
	{
		inteiro i, numeroCircuito = 1, temDisponivelC = 0, alugarCircuito, iDisponiveisC[15], contaDisponiveisC = 0
		real receitaCircuito

		escreva("\n-ALUGAR CIRCUITO-\n")

		para(i = 0; i < 15; i++){
			se(locado[i] == falso e circuito[i] != ""){
				escreva("\n", numeroCircuito, ". ", circuito[i], "\n")

				iDisponiveisC[contaDisponiveisC] = i

				contaDisponiveisC++

				numeroCircuito++

				temDisponivelC = 1

				
			}
		}

		se(temDisponivelC == 0){
			escreva("\nNão há nenhum Kart disponível para locação no momento.\n")
		}senao{
			escreva("\nDigite um valor referente ao Circuito que deseja alugar: ")
			leia(alugarCircuito)

			enquanto(alugarCircuito < 1 ou alugarCircuito > contaDisponiveisC){
				escreva("\nValor inválido. Digite um valor referente ao Kart que deseja alugar: ")
				leia(alugarCircuito)
			}

			inteiro indexReal = iDisponiveisC[alugarCircuito - 1]

			locado[indexReal] = verdadeiro

			escreva("\nO Circuito ", circuito[indexReal], " foi alugado com sucesso!\n")

			receitaCircuito = valor[indexReal]

			receita = receita + receitaCircuito

			lucro = (70.0 / 100.0) * receitaCircuito
	          }
	}

	funcao voltarAoMenu(){
		inteiro voltarParaMenu
		
		escreva("\nDigite 1 para voltar ao Menu: ")
		leia(voltarParaMenu)

		enquanto(voltarParaMenu != 1){
			escreva("\nValor inválido! Digite 1 para voltar ao Menu: ")
			leia(voltarParaMenu)
		}
	}

	funcao mostraMenu(){
		escreva("KART MANIA - MENU PRINCIPAL\n\n")u.aguarde(100)
		escreva("1. Cadastrar um Kart\n\n")u.aguarde(100)
		escreva("2. Listar Karts disponíveis\n\n")u.aguarde(100)
		escreva("3. Listar Karts locados\n\n")u.aguarde(100)
		escreva("4. Alugar um Kart\n\n")u.aguarde(100)
		escreva("5. Devolver um Kart\n\n")u.aguarde(100)
		escreva("6. Kart que mais gerou ganhos\n\n")u.aguarde(100)
		escreva("7. Cadastrar um Circuito\n\n")u.aguarde(100)
		escreva("8. Receita e lucro do dia, considerando Karts locados\n\n")u.aguarde(100)
		escreva("9. Locação de circuito\n\n")u.aguarde(100)
		escreva("10. Atualizar dia\n\n")u.aguarde(100)
		escreva("11. Sair do programa\n\n")u.aguarde(100)
	}
	
	funcao inicio(){
		inteiro painelInicial = 0, nVezesLocado[15], quantidadeLocados = 0, alugarKart
		inteiro kartsCadastrados = 0, circuitosCadastrados = 0, i
		logico estaLocado[15], estaLocadoCircuito[15]
		cadeia modeloKart[15], modeloCircuito[15]
		real valorLocacao[15], receitaDiaria = 0.0, lucroDiario = 0.0, ValorLocacaoCircuito[15]
		real receitaTotal = 0.0, LucroTotal = 0.0, Receita = 0.0, receitaTotalC = 0.0
		
		enquanto(painelInicial != 11){
			mostraMenu()
			escreva("Digite o valor referente à opção que deseja acessar: ")
			leia(painelInicial)

			se(painelInicial == 1){
				se(kartsCadastrados == 15){
					escreva("\nVocê já cadastrou o máximo número de Karts possíveis.\n")
				}senao{
					cadastrarKart(modeloKart, valorLocacao, estaLocado)
					kartsCadastrados++
				}

				voltarAoMenu()

				escreva("\n\n")
			}
			
			senao se(painelInicial == 2){
				listarKartsDisponiveis(estaLocado, modeloKart, valorLocacao, nVezesLocado)

				voltarAoMenu()

				escreva("\n\n")
			}

			senao se(painelInicial == 3){
				listarKartsLocados(estaLocado, modeloKart)

				voltarAoMenu()

				escreva("\n\n")
			}

			senao se(painelInicial == 4){
				alugarUmKart(estaLocado, modeloKart, nVezesLocado, receitaDiaria, valorLocacao, lucroDiario)
				
				voltarAoMenu()

				escreva("\n\n")
			}

			senao se(painelInicial == 5){
				devolverUmKart(estaLocado, modeloKart)

				voltarAoMenu()

				escreva("\n\n")
			}

			senao se(painelInicial == 6){

				valorMaiorKart(modeloKart, valorLocacao, estaLocado, nVezesLocado)

				voltarAoMenu()
				
				escreva("\n\n")
			}

			senao se(painelInicial == 7){

				se(circuitosCadastrados == 15)
				{
					escreva("\nVocê já cadastrou o máximo número de Circuitos possiveis.\n")
				}
				senao
				{
					cadastrarCircuito(modeloCircuito, ValorLocacaoCircuito, estaLocadoCircuito)
					
					circuitosCadastrados++
				}

				voltarAoMenu()

				escreva("\n\n")
			}

			senao se(painelInicial == 8)
			{
				AlugarCircuito (estaLocadoCircuito, modeloCircuito, receitaDiaria, ValorLocacaoCircuito, lucroDiario)

				voltarAoMenu()

				escreva("\n\n")
			}

			senao se(painelInicial == 9)
			{
				para(i = 0; i < 15; i++)
				{
					se(estaLocado[i] == verdadeiro)
					{
						receitaTotal = receitaTotal + valorLocacao[i]

						Receita = Receita + valorLocacao[i] * 0.3
						
						LucroTotal = LucroTotal + Receita

						Receita = 0

					}
					senao
					{
						receitaTotal = receitaTotal + 0

						Receita = Receita + 0

						LucroTotal = LucroTotal + 0

					}

					se(estaLocadoCircuito[i] == verdadeiro)
					{
						receitaTotalC = receitaTotalC + receitaTotal + (valorLocacao[i] * (70/100))
					}
					senao
					{
						receitaTotalC = receitaTotalC + 0
					}

				
					
				
					
					
				}
				
				escreva("A receita diaria é ", receitaTotal, "\n")
				escreva("O lucro diario é ", LucroTotal, "\n")
				escreva("A receita diaria co circuito é ", receitaTotalC, "\n")
				
				voltarAoMenu()

				escreva("\n\n")
			}

			senao se(painelInicial == 10)
			{
				para(i = 0; i < 15; i++)
				{
				 se(estaLocado[i] == verdadeiro)
				 {
				 	LucroTotal = 0.0
				 	receitaTotal = 0.0
				 	Receita = 0.0
				 	modeloKart[i] = modeloKart[i]
					estaLocado[i] = estaLocado[i]
					valorLocacao[i] = valorLocacao[i]
					Receita = valorLocacao[i] * (30/100)
					receitaTotal = receitaTotal + valorLocacao[i]
					LucroTotal = LucroTotal + Receita

					escreva("O ", modeloKart[i], " ainda está alugado, cobrar a locoção ", valorLocacao[i], " novamente\n")
				 }
				 senao
				 {
				 	modeloKart[i] = modeloKart[i]
					estaLocado[i] = estaLocado[i]
					valorLocacao[i] = valorLocacao[i]
					receitaDiaria = 0.0
					lucroDiario = 0.0
				 }
				}

				voltarAoMenu()

				escreva("\n\n")
			}
			


			senao se(painelInicial < 1 ou painelInicial > 10){
				escreva("\nDigite um valor válido!\n\n")
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 6655; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */