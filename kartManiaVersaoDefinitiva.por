programa
{
	inclua biblioteca Util --> u

	funcao valorMaiorKart(cadeia kartMaior[], real valor[], inteiro vezesLocado[], logico locado[]){
		//Função que faz o cálculo do Kart que mais gerou ganhos e retorna as informações dele
		inteiro i, vezesLocadoM = 0, existeKartLocado = 0
		real valorKartMGanhos = 0.0, maiorValor = 0.0
		cadeia kartM = ""
		logico locadoAtualmente = falso

		escreva("\n-KART QUE MAIS GEROU GANHOS-\n")
		
		para(i = 0; i < 15; i++){
			se(valor[i] * vezesLocado[i] > maiorValor e vezesLocado[i] > 0){
				maiorValor = valor[i] * vezesLocado[i]
				
				kartM = kartMaior[i]
				
				vezesLocadoM = vezesLocado[i]

				valorKartMGanhos = valor[i]
				
				se(locado[i]){
					locadoAtualmente = verdadeiro
				}senao{
					locadoAtualmente = falso
				}

				existeKartLocado = 1
			}
		}
		se(existeKartLocado == 0){
			escreva("\nNenhum Kart gerou ganhos até o momento pois ainda não houveram locações.\n")
		}senao{
			escreva("\nO Kart que gerou mais ganhos neste dia foi: " + kartM + "\nO preço do Kart é:R$", valorKartMGanhos)
			
			escreva("\nNúmero de vezes que ele foi locado: ", vezesLocadoM)
			
			se(locadoAtualmente){
				escreva("\nEste Kart está locado.\n")
			}senao{
				escreva("\nEste Kart não está locado.\n")
			}
		}
	}
	
	funcao cadastrarKart(cadeia modelo[], real valor[], logico locado[]){
		//Função que permite ao usuário cadastrar um Kart. O usuário fornece o modelo e o valor de locação do Kart
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

				escreva("\nSeu Kart foi cadastrado com sucesso!\n")

				cadastrado = 1
			}
		}
	}

	funcao listarKartsDisponiveis(logico locado[], cadeia modelo[], real valor[], inteiro vezesLocado[]){
		//Essa função lista todas as informações dos Karts que já foram cadastrados
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

				u.aguarde(200)
			}
		}

		se(temDisponivel == 0){
			escreva("\nNão há nenhum Kart disponível no momento.\n")
		}
	}

	funcao listarKartsLocados(logico locado[], cadeia modelo[]){
		//Essa função lista somente o modelo dos Karts que estão locados no momento
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

	funcao alugarUmKart(logico locado[], cadeia modelo[], inteiro quantidadeLocado[], real &receita, real valor[]){
		//Essa função permite ao usuário escolher alugar um Kart.
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

			quantidadeLocado[indexReal]++
		}
	}

	funcao devolverUmKart(logico locado[], cadeia modelo[]){
		//Essa função permite ao usuário devolver um Kart que está locado.
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

	funcao alugarCircuito(logico &cLocado){
		//Essa função permite ao usuário escolher alugar a pista.
		inteiro alugarOuSair
		
		escreva("\n-ALUGAR CIRCUITO-\n")

		se(cLocado){
			escreva("\nO circuito já foi locado.\n")
		}senao{
			escreva("\nValor de locação do circuito: R$500,0\n")

			escreva("\n1. Alugar circuito\n\n2. Sair\n\n")
			leia(alugarOuSair)

			enquanto(alugarOuSair < 1 ou alugarOuSair > 2){
				escreva("\nValor inválido. Por favor, digite 1 para alugar o circuito ou 2 para sair:")
				leia(alugarOuSair)
			}

			se(alugarOuSair == 1){
			cLocado = verdadeiro
			escreva("\nCircuito locado com sucesso!\n")
			}
		}
	}

	funcao voltarAoMenu(){
		//Essa função fornece ao usuário digitar um valor para voltar ao Menu Principal do programa
		inteiro voltarParaMenu
		
		escreva("\nDigite 1 para voltar ao Menu: ")
		leia(voltarParaMenu)

		enquanto(voltarParaMenu != 1){
			escreva("\nValor inválido! Digite 1 para voltar ao Menu: ")
			leia(voltarParaMenu)
		}
	}

	funcao mostraMenu(){
		//Essa função exibe todo o Menu Principal do programa
		escreva("KART MANIA - MENU PRINCIPAL\n\n")u.aguarde(100)
		escreva("1. Cadastrar um Kart\n\n")u.aguarde(100)
		escreva("2. Listar Karts disponíveis\n\n")u.aguarde(100)
		escreva("3. Listar Karts locados\n\n")u.aguarde(100)
		escreva("4. Alugar um Kart\n\n")u.aguarde(100)
		escreva("5. Devolver um Kart\n\n")u.aguarde(100)
		escreva("6. Kart que mais gerou ganhos\n\n")u.aguarde(100)
		escreva("7. Receita e lucro do dia, considerando Karts locados\n\n")u.aguarde(100)
		escreva("8. Locação de circuito\n\n")u.aguarde(100)
		escreva("9. Atualizar dia\n\n")u.aguarde(100)
		escreva("10. Sair do programa\n\n")u.aguarde(100)
	}
	
	funcao inicio(){
		inteiro painelInicial = 0, nVezesLocado[15], quantidadeLocados = 0, alugarKart, comecar = 0
		inteiro kartsCadastrados = 0, circuitosCadastrados = 0, i
		logico estaLocado[15], circuitoLocado = falso
		cadeia modeloKart[15], modeloCircuito[15]
		real valorLocacao[15], receitaDiaria = 0.0, lucroDiario = 0.0, ValorLocacaoCircuito[15], valorCircuito = 500.0
		real receitaTotal = 0.0, LucroTotal = 0.0, Receita = 0.0, receitaTotalC = 0.0

		escreva("Seja bem-vindo(a) ao Kart Mania!\n\n")
		escreva("Estamos empolgados em ter você a bordo do nosso sistema de locação de Karts.")
		escreva("\n\nNo Kart Mania, oferecemos uma experiência completa para gerenciar sua frota de Karts com facilidade e eficiência.")
		escreva("\n\nPrepare-se para acelerar seu negócio! Digite 1 para começar: ")
		leia(comecar)
		escreva("\n")

		enquanto(comecar != 1){
			escreva("Valor inválido. Digite 1 para começar: ")
			leia(comecar)
		}
		
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
				alugarUmKart(estaLocado, modeloKart, nVezesLocado, receitaDiaria, valorLocacao)
				
				voltarAoMenu()

				escreva("\n\n")
			}

			senao se(painelInicial == 5){
				devolverUmKart(estaLocado, modeloKart)

				voltarAoMenu()

				escreva("\n\n")
			}

			senao se(painelInicial == 6){
				valorMaiorKart(modeloKart, valorLocacao, nVezesLocado, estaLocado)

				voltarAoMenu()
				
				escreva("\n\n")
			}

			senao se(painelInicial == 7){
				se(circuitoLocado == verdadeiro){
					receitaDiaria = receitaDiaria + 350 //350 é 70% do valor de locação do circuito (500)
				}

				escreva("\n-RECEITA E LUCRO DO DIA-\n")
				
				escreva("\nA receita diaria é R$", receitaDiaria, "\n")
				
				lucroDiario = (30 / 100) * receitaDiaria

				escreva("\nO lucro do dia é R$", lucroDiario, "\n")
				
				voltarAoMenu()

				escreva("\n\n")
			}

			senao se(painelInicial == 8){
				alugarCircuito(circuitoLocado)

				voltarAoMenu()

				escreva("\n\n")
			}

			senao se(painelInicial == 9){
				escreva("\n-ATUALIZAR DIA-\n")
				
				para(i = 0; i < 15; i++){
					se(estaLocado[i] == verdadeiro){
						escreva("O Kart de modelo ", modeloKart[i], " ainda está locado.")
						escreva("\nSeu valor de locação (R$", valorLocacao[i], ") será cobrado novamente.\n\n")
					}
				}
				circuitoLocado = falso

				receitaDiaria = 0.0

				lucroDiario = 0.0

				escreva("\nO dia foi atualizado com sucesso!\n")
				
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
 * @POSICAO-CURSOR = 2820; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */