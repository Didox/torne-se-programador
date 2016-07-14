function mostra(mensagem){
  document.write(mensagem + "<br>")
}

function capturarAlunos(){
  alunos = []
  for(i=1; i<=4;i++){
    nome = prompt("Digite o nome do aluno")
    nota1 = parseInt(prompt("Digite a nota 1 do aluno " + nome))
    nota2 = parseInt(prompt("Digite a nota 2 do aluno " + nome))

    aluno = {
      nome: nome,
      nota1: nota1,
      nota2: nota2,
      media: 0,
      situacao: ''
    }

    alunos.push(aluno)
  }
  return alunos;
}

function alunosProntos(){
  alunos = []
  for(i=1; i<=4;i++){
    nome = "Aluno " + i
    nota1 = i + 5
    nota2 = i + 4

    aluno = {
      nome: nome,
      nota1: nota1,
      nota2: nota2,
      media: 0,
      situacao: ''
    }

    alunos.push(aluno)
  }
  return alunos;
}

function mostrarRelatoriosDeAlunos(alunos){
  mostra("Relatorio de notas")
  mostra("Aluno ================ nota 1 ================ nota 2 ================ media ================ situacao")
  for(i=0; i<alunos.length;i++){
    alunos[i].media = (alunos[i].nota1 + alunos[i].nota2) / 2

    situacao = ""
    if(alunos[i].media >= 7){
      situacao = "Aprovado"
    }
    else if(alunos[i].media < 5){
      situacao = "Reprovado"
    }
    else{
      situacao = "Exame"
    }

    alunos[i].situacao = situacao

    mostra(alunos[i].nome + " ================ " + alunos[i].nota1 + " ================ " + alunos[i].nota2 + " ================ " + alunos[i].media + " ================ " + alunos[i].situacao)
  }

  return alunos;
}

function mostrarMediaDaClasse(alunos){
  soma_media_alunos = 0;
  for(i=0; i<alunos.length;i++){
    soma_media_alunos = soma_media_alunos + alunos[i].media
  }

  media_da_classe = soma_media_alunos / alunos.length
  mostra("media da classe e: " + media_da_classe)
}

function mostrarQuantidadeAlunos(alunos){
  quantidade_alunos_reprovados = 0
  quantidade_alunos_aprovados = 0
  quantidade_alunos_exame = 0

  for(i=0; i<alunos.length;i++){
    if(alunos[i].situacao == "Aprovado"){
      quantidade_alunos_aprovados = quantidade_alunos_aprovados + 1
    }
    else if(alunos[i].situacao == "Reprovado"){
      quantidade_alunos_reprovados = quantidade_alunos_reprovados + 1
    }
    else{
      quantidade_alunos_exame = quantidade_alunos_exame + 1
    }
  }

  mostra("quandidade de alunos aprovados: " + quantidade_alunos_aprovados)
  mostra("quandidade de alunos reprovados: " + quantidade_alunos_reprovados)
  mostra("quandidade de alunos em exame: " + quantidade_alunos_exame)
}







