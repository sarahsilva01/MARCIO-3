import 'package:flutter/material.dart';

class DetalhesMcQueen extends StatefulWidget {
  const DetalhesMcQueen({super.key});

  @override
  State<DetalhesMcQueen> createState() => _DetalhesMcQueenState();
}

class _DetalhesMcQueenState extends State<DetalhesMcQueen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Detalhes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.redAccent,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          tabs: const [
            Tab(text: '📝 Sinopse'),
            Tab(text: '🎬 Elenco'),
            Tab(text: '🎥 Direção'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSinopse(),
          _buildElenco(),
          _buildDirecao(),
        ],
      ),
    );
  }

  Widget _buildSinopse() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Text(
          'Em um mundo onde a velocidade dita as regras, Relâmpago McQueen retorna às pistas não apenas para competir, mas para provar que ainda é capaz de inspirar uma nova geração.\n\n'
          'Após anos afastado, McQueen se vê em um cenário completamente diferente — onde a tecnologia domina e as rivalidades são mais intensas do que nunca. Enfrentando não só novos corredores velozes e arrogantes, mas também suas próprias dúvidas, ele embarca em uma jornada de superação, amizade e redescoberta.\n\n'
          'Com a ajuda de velhos amigos e novos aliados, McQueen entenderá que vencer vai muito além da linha de chegada — é sobre deixar um legado.\n\n'
          'Prepare-se para a corrida mais emocionante da sua vida.',
          style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  Widget _buildElenco() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        PersonagemCard(
          nome: 'Relâmpago McQueen',
          imagem: '',
          descricao:
              'Um astro das corridas, conhecido por sua velocidade e confiança. Com o tempo, McQueen amadureceu, aprendendo que vencer não é tudo — e que inspirar outros pode ser sua maior conquista.',
        ),
        PersonagemCard(
          nome: 'Cruz Ramirez',
          imagem: '',
          descricao:
              'Jovem, determinada e cheia de energia, Cruz começou como treinadora e se tornou piloto. Ela representa a nova geração, enfrentando medos e quebrando barreiras com coragem.',
        ),
        PersonagemCard(
          nome: 'Mate',
          imagem: '',
          descricao:
              'O melhor amigo de McQueen, um guincho simpático e desengonçado. Apesar de parecer atrapalhado, é extremamente leal, sincero e sempre pronto para ajudar com seu bom humor.',
        ),
        PersonagemCard(
          nome: 'Jackson Storm',
          imagem: '',
          descricao:
              'Um corredor moderno, tecnológico e arrogante. É o símbolo da nova era das corridas, mas aprende que ser o mais rápido nem sempre significa ser o melhor.',
        ),
      ],
    );
  }

  Widget _buildDirecao() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const Text(
            'Avalie a Direção do Filme:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          AvaliacaoRadio(
            pergunta:
                'A direção conseguiu transmitir emoção durante as corridas?',
            opcoes: [
              'Vibrei em cada curva!',
              'Faltou intensidade.',
              'Nada empolgante.'
            ],
          ),
          AvaliacaoRadio(
            pergunta: 'Como você avalia o ritmo do filme?',
            opcoes: [
              'Envolvente do início ao fim',
              'Oscilou em alguns momentos',
              'Arrastado demais'
            ],
          ),
          AvaliacaoRadio(
            pergunta: 'Os personagens foram bem desenvolvidos?',
            opcoes: [
              'Sim, todos tiveram destaque',
              'Só o protagonista brilhou',
              'Faltou desenvolvimento'
            ],
          ),
          AvaliacaoRadio(
            pergunta: 'A direção soube equilibrar emoção e humor?',
            opcoes: [
              'Sim, na medida certa',
              'Um pouco forçado',
              'Faltou naturalidade'
            ],
          ),
          AvaliacaoRadio(
            pergunta: 'Você recomendaria o filme pela direção?',
            opcoes: ['Com certeza', 'Talvez', 'Não'],
          ),
        ],
      ),
    );
  }
}

class PersonagemCard extends StatelessWidget {
  final String nome;
  final String imagem;
  final String descricao;

  const PersonagemCard({
    super.key,
    required this.nome,
    required this.imagem,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: imagem.isNotEmpty
            ? Image.asset(imagem, width: 50, height: 50, fit: BoxFit.cover)
            : const Icon(Icons.directions_car, color: Colors.white70, size: 40),
        title: Text(
          nome,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          descricao,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}

class AvaliacaoRadio extends StatefulWidget {
  final String pergunta;
  final List<String> opcoes;

  const AvaliacaoRadio(
      {super.key, required this.pergunta, required this.opcoes});

  @override
  State<AvaliacaoRadio> createState() => _AvaliacaoRadioState();
}

class _AvaliacaoRadioState extends State<AvaliacaoRadio> {
  String? _respostaSelecionada;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.pergunta,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        ...widget.opcoes.map((opcao) {
          return RadioListTile<String>(
            title: Text(opcao, style: const TextStyle(color: Colors.white)),
            value: opcao,
            groupValue: _respostaSelecionada,
            activeColor: Colors.redAccent,
            onChanged: (valor) {
              setState(() {
                _respostaSelecionada = valor;
              });
            },
            contentPadding: EdgeInsets.zero,
          );
        }).toList(),
        const SizedBox(height: 24),
      ],
    );
  }
}
