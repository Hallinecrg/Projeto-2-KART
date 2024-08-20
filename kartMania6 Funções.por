programa
{
	inclua biblioteca Util --> u

	funcao valorMaiorKart(cadeia kartMaior[], real kartValorM[], logico locacao[]){
		inteiro i
		real valorAtual, maiorValor = 0.0
		cadeia kartM = " "

		
		para (i = 0; i < 15; i++){

			se (locacao[i] == verdadeiro){
				
				valorAtual = kartValorM[i]

				se (valorAtual > maiorValor){

					maiorValor = valorAtual
					kartM = kartMaior[i]
				}
			}
		}
		escreva ("O kart que gerou mais ganhos neste dia foi:" + kartM + "\nEle gerou um total de:R$", maiorValor)
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
		escreva("KART MANIA - MENU PRINCIPAL\n\n")u.aguarde(300)
		escreva("1. Cadastrar um Kart\n\n")u.aguarde(300)
		escreva("2. Listar Karts disponíveis\n\n")u.aguarde(300)
		escreva("3. Listar Karts locados\n\n")u.aguarde(300)
		escreva("4. Alugar um Kart\n\n")u.aguarde(300)
		escreva("5. Devolver um Kart\n\n")u.aguarde(300)
		escreva("6. Kart que mais gerou ganhos\n\n")u.aguarde(300)
		escreva("7. Receita e lucro do dia, considerando Karts locados\n\n")u.aguarde(300)
		escreva("8. Locação de circuito\n\n")u.aguarde(300)
		escreva("9. Atualizar dia\n\n")u.aguarde(300)
		escreva("10. Sair do programa\n\n")u.aguarde(300)
	}
	
	funcao inicio(){
		inteiro painelInicial = 0, nVezesLocado[15], quantidadeLocados = 0, alugarKart
		inteiro kartsCadastrados = 0
		logico estaLocado[15]
		cadeia modeloKart[15]
		real valorLocacao[15], receitaDiaria = 0.0, lucroDiario = 0.0
		
		enquanto(painelInicial != 10){
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

				valorMaiorKart(modeloKart, valorLocacao, estaLocado)

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
 * @POSICAO-CURSOR = 513; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {kartMaior, 5, 30, 9}-{kartValorM, 5, 48, 10}-{i, 6, 10, 1}-{valorAtual, 7, 7, 10}-{maiorValor, 7, 19, 10}-{kartM, 8, 9, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */