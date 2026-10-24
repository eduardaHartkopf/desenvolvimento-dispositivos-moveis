import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'
    as carousel; // Importa a biblioteca sem confundir seus nomes com os do Flutter.

void main() {
  runApp(
    // Inicia o aplicativo com as configurações visuais abaixo.
    MaterialApp(
      // Configura o tema e a primeira tela do aplicativo.
      theme: ThemeData(
        // Centraliza as cores usadas pelo aplicativo.
        brightness:
            Brightness.dark, // Usa textos claros adequados ao tema escuro.
        scaffoldBackgroundColor:
            Colors.black, // Define o fundo das telas como preto.
        canvasColor:
            Colors.black, // Define o fundo padrão das superfícies como preto.
        colorScheme: const ColorScheme.dark(
          // Define as cores do tema escuro.
          primary: Colors.white, // Mantém os controles principais visíveis.
          onPrimary: Colors.black, // Define o texto sobre a cor principal.
          surface: Colors.black, // Define as superfícies como pretas.
          onSurface:
              Colors.white, // Define textos e ícones sobre superfícies pretas.
          outline: Colors.black, // Define a cor padrão dos contornos.
          outlineVariant:
              Colors.black, // Define a cor dos contornos secundários.
        ), // Fecha o conjunto de cores.
        dividerColor: Colors.black, // Define as linhas divisórias como pretas.
        inputDecorationTheme: const InputDecorationTheme(
          // Configura todos os campos de texto.
          filled: true, // Ativa o preenchimento dos campos.
          fillColor: Colors.white, // Define o fundo branco das caixas de texto.
          labelStyle: TextStyle(
              color: Colors
                  .black87), // Exibe o rótulo dentro da caixa branca em preto.
          floatingLabelStyle: TextStyle(
              color: Colors.white), // Exibe o rótulo acima da caixa em branco.
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black)), // Define a borda padrão preta.
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black)), // Mantém a borda preta sem foco.
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 2)), // Mantém a borda preta ao digitar.
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color:
                      Colors.black)), // Mantém a borda preta quando desativado.
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors
                      .black)), // Mantém o contorno preto em caso de erro.
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black,
                  width: 2)), // Mantém o contorno preto com foco e erro.
        ), // Fecha a configuração dos campos.
        elevatedButtonTheme: ElevatedButtonThemeData(
          // Configura os botões elevados.
          style: ElevatedButton.styleFrom(
            // Define a aparência do botão.
            backgroundColor: Colors.white, // Define o fundo branco do botão.
            foregroundColor:
                Colors.black, // Exibe o texto preto sobre o botão branco.
            surfaceTintColor:
                Colors.transparent, // Evita uma tonalidade extra no fundo.
            shadowColor: Colors.transparent, // Remove a sombra colorida.
            side: const BorderSide(
                color: Colors.black), // Define o contorno preto.
          ), // Fecha o estilo do botão.
        ), // Fecha a configuração dos botões.
      ), // Fecha o tema do aplicativo.
      home: const ListaComprasPage(), // Mantém a tela inicial existente.
    ), // Fecha a configuração do aplicativo.
  ); // Exibe o aplicativo.
}

class BannersCarrossel extends StatefulWidget {
  // Separa o carrossel do formulário e da lista.
  const BannersCarrossel(
      {super.key}); // Permite criar o componente sem dados externos.

  @override // Implementa o estado deste componente.
  State<BannersCarrossel> createState() =>
      _BannersCarrosselState(); // Cria o controle dos banners.
} // Fecha o componente do carrossel.

class _BannersCarrosselState extends State<BannersCarrossel> {
  // Guarda qual banner está visível.
  final _controller = carousel
      .CarouselSliderController(); // Controla a troca pelas setas e indicadores.
  int _bannerAtual = 0; // Começa com o primeiro banner selecionado.
  static const _imagens = [
    // Define a ordem dos arquivos incluídos no aplicativo.
    'assets/images/banner_eletro_music.png', // Primeiro banner: Eletro Music.
    'assets/images/banner_festival_neon.png', // Segundo banner: Summer Electro Music.
    'assets/images/banner_electronic_fest.png', // Terceiro banner: Electronic Music Fest.
  ]; // Fecha a lista de imagens.
  static const _descricoes = [
    // Descreve os banners para leitores de tela.
    'Eletro Music — ingressos premium', // Descrição do primeiro banner.
    'Summer Electro Music Festival', // Descrição do segundo banner.
    'Electronic Music Fest — Night Party', // Descrição do terceiro banner.
  ]; // Fecha a lista de descrições.

  @override // Define o conteúdo visual do componente.
  Widget build(BuildContext context) {
    // Monta o carrossel e os controles.
    return Column(
      // Organiza os banners e os indicadores na vertical.
      children: [
        // Inicia os elementos do carrossel.
        Center(
          // Centraliza o banner nas janelas largas do Windows.
          child: ConstrainedBox(
            // Limita o tamanho do banner em telas grandes.
            constraints:
                const BoxConstraints(maxWidth: 800), // Limita a largura a 800.
            child: Stack(
              // Coloca as setas sobre o carrossel.
              alignment: Alignment
                  .center, // Centraliza os controles na altura do banner.
              children: [
                // Inicia as camadas do banner.
                carousel.CarouselSlider.builder(
                  // Cria os banners com a biblioteca carousel_slider.
                  carouselController:
                      _controller, // Conecta as setas e os indicadores ao carrossel.
                  itemCount: _imagens.length, // Define a quantidade de banners.
                  options: carousel.CarouselOptions(
                    // Configura a passagem das fotos.
                    aspectRatio:
                        2, // Mantém a proporção de duas unidades de largura para uma de altura.
                    viewportFraction: 1, // Exibe um banner inteiro por vez.
                    autoPlay: !MediaQuery.of(context)
                        .disableAnimations, // Respeita a preferência do sistema por reduzir animações.
                    autoPlayInterval: const Duration(
                        seconds: 4), // Troca o banner a cada quatro segundos.
                    autoPlayAnimationDuration: const Duration(
                        milliseconds: 600), // Define a duração da transição.
                    autoPlayCurve:
                        Curves.easeInOut, // Suaviza o início e o fim da troca.
                    enableInfiniteScroll:
                        true, // Volta ao primeiro banner depois do último.
                    pauseAutoPlayOnTouch:
                        true, // Pausa a troca automática enquanto o usuário interage.
                    onPageChanged: (index, reason) {
                      // Detecta a troca automática ou manual.
                      setState(() => _bannerAtual =
                          index); // Atualiza o indicador do banner atual.
                    }, // Fecha a atualização do indicador.
                  ), // Fecha as opções do carrossel.
                  itemBuilder: (context, index, realIndex) => ClipRRect(
                    // Arredonda os cantos de cada banner.
                    borderRadius: BorderRadius.circular(
                        12), // Define o arredondamento dos cantos.
                    child: Image.asset(
                      // Carrega a imagem local, sem depender da internet.
                      _imagens[
                          index], // Seleciona a imagem pela posição na lista.
                      width: double.infinity, // Usa toda a largura disponível.
                      fit: BoxFit
                          .contain, // Mostra a arte inteira sem cortar ou distorcer.
                      semanticLabel: _descricoes[
                          index], // Descreve a imagem para leitores de tela.
                    ), // Fecha a imagem.
                  ), // Fecha os cantos arredondados.
                ), // Fecha o carrossel de imagens.
                Positioned(
                  // Posiciona a seta anterior.
                  left: 4, // Afasta a seta da borda esquerda.
                  child: IconButton(
                    // Cria o botão de voltar.
                    tooltip: 'Banner anterior', // Descreve a ação do botão.
                    style: IconButton.styleFrom(
                        backgroundColor: Colors
                            .black54), // Destaca a seta sobre fotos claras.
                    icon: const Icon(Icons.chevron_left,
                        color: Colors
                            .white), // Mostra a seta branca para a esquerda.
                    onPressed: () => _controller
                        .previousPage(), // Volta para o banner anterior.
                  ), // Fecha o botão de voltar.
                ), // Fecha o posicionamento da seta esquerda.
                Positioned(
                  // Posiciona a seta seguinte.
                  right: 4, // Afasta a seta da borda direita.
                  child: IconButton(
                    // Cria o botão de avançar.
                    tooltip: 'Próximo banner', // Descreve a ação do botão.
                    style: IconButton.styleFrom(
                        backgroundColor: Colors
                            .black54), // Destaca a seta sobre fotos claras.
                    icon: const Icon(Icons.chevron_right,
                        color: Colors
                            .white), // Mostra a seta branca para a direita.
                    onPressed: () =>
                        _controller.nextPage(), // Avança para o próximo banner.
                  ), // Fecha o botão de avançar.
                ), // Fecha o posicionamento da seta direita.
              ], // Fecha as camadas do banner.
            ), // Fecha a sobreposição das setas.
          ), // Fecha o limite de largura.
        ), // Fecha a centralização do carrossel.
        Row(
          // Organiza os indicadores abaixo dos banners.
          mainAxisAlignment:
              MainAxisAlignment.center, // Centraliza os indicadores.
          children: List.generate(_imagens.length, (index) {
            // Cria um indicador clicável para cada banner.
            return IconButton(
              // Permite selecionar um banner pelo indicador.
              tooltip:
                  'Mostrar banner ${index + 1}', // Identifica o destino do botão.
              onPressed: () => _controller.animateToPage(
                  index), // Vai diretamente para o banner escolhido.
              icon: Icon(
                // Desenha a bolinha do indicador.
                _bannerAtual == index
                    ? Icons.circle
                    : Icons
                        .circle_outlined, // Preenche a bolinha do banner atual.
                size: 10, // Define o tamanho da bolinha.
                color:
                    Colors.white, // Mantém o indicador visível no fundo preto.
              ), // Fecha o ícone do indicador.
            ); // Fecha o botão indicador.
          }), // Fecha a criação dos indicadores.
        ), // Fecha a linha dos indicadores.
      ], // Fecha os elementos do carrossel.
    ); // Retorna o componente montado.
  } // Fecha a construção visual.
} // Fecha o estado do carrossel.

class ListaEventos extends StatelessWidget {
  // Monta a seção com os eventos de exemplo.
  const ListaEventos(
      {super.key}); // Permite reutilizar a lista na página inicial.

  static const _eventos = [
    // Guarda os dados provisórios usados no front-end.
    (
      nome: 'Lana Del Rey | Festival',
      imagem: 'assets/images/evento_lana_del_rey.png'
    ), // Primeiro evento e sua imagem.
    (
      nome: 'Zara Larsson | Pop Tropical de Verão',
      imagem: 'assets/images/evento_pop_tropical.png'
    ), // Segundo evento e sua imagem.
    (
      nome: 'Dua Lipa | Future Nostalgia',
      imagem: 'assets/images/evento_future_nostalgia.png'
    ), // Terceiro evento e sua imagem.
  ]; // Fecha a lista de eventos demonstrativos.

  @override // Define como a seção aparece na tela.
  Widget build(BuildContext context) {
    // Constrói os cards dos eventos.
    return Column(
      // Organiza o título e a lista na vertical.
      crossAxisAlignment:
          CrossAxisAlignment.stretch, // Usa a largura disponível.
      children: [
        // Inicia os elementos da seção.
        const Text(
          // Exibe o título da seção.
          'Eventos em destaque', // Identifica a lista de eventos.
          style: TextStyle(
              color: Color(0xFFB794F6),
              fontSize: 22,
              fontWeight:
                  FontWeight.bold), // Usa roxo e negrito como na referência.
        ), // Fecha o título da seção.
        const SizedBox(height: 16), // Separa o título do primeiro card.
        ListView.builder(
          // Cria um card para cada evento.
          shrinkWrap: true, // Ajusta a altura à quantidade de eventos.
          physics:
              const NeverScrollableScrollPhysics(), // Mantém a rolagem na página principal.
          itemCount: _eventos.length, // Define a quantidade de cards.
          itemBuilder: (context, index) {
            // Constrói cada card pela sua posição.
            final evento = _eventos[index]; // Obtém os dados do evento atual.
            return CardEvento(
              nome: evento.nome,
              imagem: evento.imagem, // Passa a foto para o card.
              onTap: index == 0
                  ? () {
                      // Ativa a navegação apenas no card da Lana Del Rey.
                      Navigator.push(
                        // Abre outra tela, mantendo a página inicial para voltar.
                        context, // Usa o navegador da página atual.
                        MaterialPageRoute<void>(
                          // Cria a rota com a transição padrão do Material.
                          builder: (context) =>
                              const LanaExemploPage(), // Define qual tela será aberta.
                        ), // Fecha a configuração da rota.
                      ); // Executa a navegação.
                    }
                  : null, // Deixa os outros cards sem ação por enquanto.
            ); // Fecha o card do evento.
          }, // Fecha a construção dos cards.
        ), // Fecha a lista de eventos.
      ], // Fecha os elementos da seção.
    ); // Retorna a seção montada.
  } // Fecha a construção visual da seção.
} // Fecha o componente da lista.

class CardEvento extends StatelessWidget {
  // Define a aparência reutilizável de uma caixinha.
  const CardEvento(
      {super.key,
      required this.nome,
      required this.imagem,
      this.onTap}); // Recebe os dados e uma ação opcional ao tocar.
  final String nome; // Guarda o título do evento.
  final String imagem; // Guarda o caminho da imagem nos assets.
  final VoidCallback? onTap; // Guarda a ação do clique, quando existir.

  @override // Define a aparência do card.
  Widget build(BuildContext context) {
    // Monta a foto e as informações.
    return Card(
      // Cria a caixa do evento.
      margin: const EdgeInsets.only(bottom: 14), // Separa este card do próximo.
      color: const Color(0xFF141416), // Define um fundo cinza bem escuro.
      surfaceTintColor: Colors.transparent, // Preserva a cor do fundo.
      elevation: 0, // Remove a sombra da caixa.
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(18)), // Arredonda os cantos do card.
      child: InkWell(
        // Permite clicar em toda a área do card.
        onTap: onTap, // Executa a ação recebida da lista de eventos.
        borderRadius:
            BorderRadius.circular(18), // Arredonda o efeito visual do toque.
        child: Padding(
          // Afasta o conteúdo das bordas da caixa.
          padding: const EdgeInsets.all(14), // Define o espaço interno do card.
          child: Row(
            // Coloca a imagem e os textos lado a lado.
            crossAxisAlignment: CrossAxisAlignment
                .start, // Alinha a imagem e os textos pelo topo.
            children: [
              // Inicia os elementos da linha.
              ClipRRect(
                // Arredonda os cantos da foto.
                borderRadius: BorderRadius.circular(
                    12), // Define o arredondamento da foto.
                child: Image.asset(
                  // Carrega a imagem incluída no aplicativo.
                  imagem, // Usa o caminho recebido pelo card.
                  width: 90, // Define a largura da miniatura.
                  height: 90, // Mantém a miniatura quadrada.
                  fit: BoxFit.contain, // Exibe a arte inteira sem distorcer.
                  excludeFromSemantics:
                      true, // Evita repetir o nome anunciado no texto ao lado.
                ), // Fecha a foto do evento.
              ), // Fecha os cantos arredondados da foto.
              const SizedBox(width: 14), // Separa a imagem das informações.
              Expanded(
                // Reserva o restante da largura para os textos.
                child: Column(
                  // Coloca o título, local e data na vertical.
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Alinha os textos à esquerda.
                  children: [
                    // Inicia as informações do evento.
                    Text(nome,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height:
                                1.25)), // Exibe o nome e permite quebrar linhas.
                    const SizedBox(
                        height:
                            10), // Separa o título das informações secundárias.
                    const Row(
                      // Coloca o ícone e o local lado a lado.
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Alinha os elementos pelo topo.
                      children: [
                        // Inicia os elementos do local.
                        Icon(Icons.location_on_outlined,
                            color: Color(0xFFB794F6),
                            size: 20), // Exibe o ícone roxo de localização.
                        SizedBox(width: 6), // Separa o ícone do texto.
                        Expanded(
                            child: Text('Local a definir',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize:
                                        14))), // Evita inventar um endereço para o evento de exemplo.
                      ], // Fecha os elementos do local.
                    ), // Fecha a linha do local.
                    const SizedBox(height: 6), // Separa o local da data.
                    const Row(
                      // Coloca o ícone e a data lado a lado.
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Alinha os elementos pelo topo.
                      children: [
                        // Inicia os elementos da data.
                        Icon(Icons.calendar_month_outlined,
                            color: Color(0xFFB794F6),
                            size: 20), // Exibe o ícone roxo de calendário.
                        SizedBox(width: 6), // Separa o ícone do texto.
                        Expanded(
                            child: Text('Data e horário a definir',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize:
                                        14))), // Reserva o espaço para os dados que serão informados depois.
                      ], // Fecha os elementos da data.
                    ), // Fecha a linha da data.
                  ], // Fecha as informações do evento.
                ), // Fecha a coluna de textos.
              ), // Fecha a largura flexível dos textos.
            ], // Fecha os elementos da linha principal.
          ), // Fecha a linha principal do card.
        ), // Fecha o espaço interno do card.
      ), // Fecha a área clicável do card.
    ); // Retorna o card montado.
  } // Fecha a construção visual do card.
} // Fecha o componente do card.

class LanaExemploPage extends StatefulWidget {
  // Cria a segunda página com o exemplo do contador.
  const LanaExemploPage({super.key}); // Permite abrir a tela sem parâmetros.

  @override // Define o estado da página.
  State<LanaExemploPage> createState() =>
      _LanaExemploPageState(); // Cria o estado que guarda o contador.
} // Fecha a definição da página.

class _LanaExemploPageState extends State<LanaExemploPage> {
  // Controla o número mostrado na tela.
  int _contador = 0; // Inicia o contador em zero a cada nova abertura.

  @override // Define a aparência da segunda página.
  Widget build(BuildContext context) {
    // Constrói o exemplo padrão de contador.
    return Scaffold(
      // Cria a estrutura da segunda tela.
      appBar: AppBar(
        // Cria o cabeçalho com a seta automática de voltar.
        title: const Text(
            'Lana Del Rey — Exemplo'), // Identifica a página aberta pelo card.
        backgroundColor: Colors.black, // Mantém o fundo preto do aplicativo.
        foregroundColor: Colors.white, // Mantém o título e a seta brancos.
      ), // Fecha o cabeçalho da segunda tela.
      body: Center(
        // Centraliza o conteúdo na página.
        child: Column(
          // Organiza a explicação e o número na vertical.
          mainAxisAlignment: MainAxisAlignment
              .center, // Centraliza os elementos na altura da tela.
          children: [
            // Inicia os elementos do contador.
            const Text('Você apertou o botão esta quantidade de vezes:',
                textAlign: TextAlign.center), // Explica o contador.
            Text('$_contador',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium), // Mostra o valor atualizado.
          ], // Fecha os elementos do contador.
        ), // Fecha a coluna do contador.
      ), // Fecha o conteúdo centralizado.
      floatingActionButton: FloatingActionButton(
        // Cria o botão de mais no canto inferior.
        tooltip: 'Incrementar contador', // Descreve a ação do botão.
        onPressed: () {
          // Executa a ação quando o botão é pressionado.
          setState(() => _contador++); // Soma um e atualiza o número na tela.
        }, // Fecha a ação do botão.
        child: const Icon(Icons.add), // Mostra o símbolo de mais.
      ), // Fecha o botão do contador.
    ); // Retorna a segunda tela montada.
  } // Fecha a construção visual da página.
} // Fecha o estado da segunda tela.

class ItemCompra {
  final String nome;
  final int quantidade;

  ItemCompra(this.nome, this.quantidade);
}

class ListaComprasPage extends StatefulWidget {
  const ListaComprasPage({super.key});

  @override
  State<ListaComprasPage> createState() => _ListaComprasPageState();
}

class _ListaComprasPageState extends State<ListaComprasPage> {
  final List<ItemCompra> _itens = [];
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();

  void _adicionarItem() {
    final nome = _nomeController.text;
    final quantidade = int.tryParse(_quantidadeController.text) ?? 0;

    if (nome.isEmpty || quantidade <= 0) {
      return;
    }

    setState(() {
      _itens.add(ItemCompra(nome, quantidade));
    });

    _nomeController.clear();
    _quantidadeController.clear();
  }

  void _removerItem(int index) {
    setState(() {
      _itens.removeAt(index);
    });
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _quantidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Cria a barra superior da tela.
        automaticallyImplyLeading:
            false, // Desativa o botão automático à esquerda.
        backgroundColor:
            Colors.black, // Define o fundo preto da barra superior.
        foregroundColor:
            Colors.white, // Mantém os textos e ícones da barra visíveis.
        surfaceTintColor:
            Colors.transparent, // Evita uma tonalidade extra sobre o fundo.
        elevation: 0, // Remove a sombra da barra.
        centerTitle: true, // Centraliza o conteúdo colocado no título.
        shape: const Border(
          // Define uma borda no cabeçalho.
          bottom: BorderSide(
              color: Colors.white,
              width: 1), // Desenha uma linha branca fina na parte inferior.
        ), // Fecha a borda do cabeçalho.
        title: Semantics(
          // Acrescenta uma descrição para leitores de tela.
          label:
              'VIBRA — Eventos e festas', // Nome da marca anunciado pelos leitores de tela.
          child: Image.asset(
            // Carrega a logo incluída nos arquivos do aplicativo.
            'assets/images/logo_vibra.png', // Caminho da imagem registrado no pubspec.yaml.
            width: 140, // Define a largura disponível para a logo.
            height: 48, // Mantém a logo dentro da altura da barra superior.
            fit: BoxFit
                .contain, // Mostra a imagem inteira sem distorcer as proporções.
            excludeFromSemantics:
                true, // Usa a descrição acessível do Semantics acima.
          ), // Fecha a imagem da logo.
        ), // Fecha a descrição acessível do símbolo.
        actions: [
          // Define os elementos à direita da barra.
          Builder(
            // Obtém um contexto que consegue acessar este Scaffold.
            builder: (context) => IconButton(
              // Constrói o botão usando esse contexto.
              tooltip:
                  'Abrir menu', // Define a dica e a descrição acessível do botão.
              icon: const Icon(Icons.menu,
                  size: 30), // Mostra o ícone de três linhas.
              onPressed: () => Scaffold.of(context)
                  .openEndDrawer(), // Abre o menu lateral direito ao tocar.
            ), // Fecha o botão de menu.
          ), // Fecha o Builder.
          const SizedBox(width: 8), // Deixa um espaço de 8 à direita do botão.
        ], // Fecha a lista de elementos da barra.
      ), // Fecha a barra superior.
      endDrawer: Drawer(
        // Cria o menu que desliza a partir da direita.
        backgroundColor: Colors.black, // Define o fundo preto do menu lateral.
        surfaceTintColor:
            Colors.transparent, // Evita uma tonalidade extra sobre o preto.
        child: SafeArea(
          // Mantém o conteúdo longe das áreas reservadas do sistema.
          child: Column(
            // Organiza os elementos do menu na vertical.
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // Estende os elementos pela largura disponível.
            children: [
              // Inicia a lista de elementos do menu.
              Padding(
                // Adiciona espaço ao redor do cabeçalho.
                padding: const EdgeInsets.fromLTRB(20, 12, 8,
                    12), // Espaços à esquerda, acima, à direita e abaixo.
                child: Row(
                  // Coloca o título e o botão de fechar lado a lado.
                  children: [
                    // Inicia os elementos dessa linha.
                    const Expanded(
                      // Reserva para o título o espaço restante da linha.
                      child: Text(
                        // Cria o texto do cabeçalho.
                        'Eventos e festas', // Define o título exibido no menu.
                        style: TextStyle(
                          // Configura a aparência do título.
                          fontSize: 20, // Define o tamanho da fonte.
                          fontWeight:
                              FontWeight.bold, // Deixa o título em negrito.
                        ), // Fecha o estilo do texto.
                      ), // Fecha o texto do cabeçalho.
                    ), // Fecha o espaço flexível do título.
                    IconButton(
                      // Cria o botão para fechar o menu.
                      tooltip:
                          'Fechar menu', // Define a dica e a descrição acessível do botão.
                      icon: const Icon(Icons.close), // Mostra o ícone de X.
                      onPressed: () =>
                          Navigator.pop(context), // Fecha o menu aberto.
                    ), // Fecha o botão de fechar.
                  ], // Fecha a lista de elementos da linha.
                ), // Fecha a linha do cabeçalho.
              ), // Fecha o espaçamento do cabeçalho.
              const Divider(
                  height: 1,
                  color: Colors.black), // Define a linha divisória preta.
              ListTile(
                // Cria uma opção clicável do menu.
                leading: const Icon(
                    Icons.home_outlined), // Mostra uma casa à esquerda.
                title: const Text('Início'), // Define o nome da opção.
                onTap: () => Navigator.pop(
                    context), // Fecha o menu, pois já estamos na tela inicial.
              ), // Fecha a opção Início.
            ], // Fecha a lista de elementos do menu.
          ), // Fecha a coluna.
        ), // Fecha a área segura.
      ), // Fecha o menu lateral.
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          // Permite rolar a página quando os banners e os campos ocuparem mais espaço.
          children: [
            const BannersCarrossel(), // Mostra os três banners abaixo do cabeçalho.
            const SizedBox(
                height: 20), // Separa os banners dos próximos elementos.
            Semantics(
              // Identifica o título para leitores de tela.
              header: true, // Marca o texto como um cabeçalho.
              child: const Text(
                // Exibe o título principal abaixo do carrossel.
                'Aqui você encontra os maiores eventos e festas de SC.', // Texto do título.
                textAlign: TextAlign.center, // Centraliza as linhas do título.
                style: TextStyle(
                  // Configura a aparência do título.
                  color: Colors.white, // Define a fonte branca.
                  fontSize: 28, // Destaca o título principal.
                  fontWeight: FontWeight.bold, // Deixa o título em negrito.
                  height: 1.2, // Define o espaço entre as linhas do título.
                ), // Fecha o estilo do título.
              ), // Fecha o texto do título.
            ), // Fecha a identificação acessível do título.
            const SizedBox(height: 12), // Separa o título do subtítulo.
            const Text(
              // Exibe a descrição abaixo do título.
              'O calendário das festas e eventos organizados por datas.', // Texto do subtítulo.
              textAlign: TextAlign.center, // Centraliza as linhas do subtítulo.
              style: TextStyle(
                // Configura a aparência do subtítulo.
                color: Colors.white, // Define a fonte branca.
                fontSize: 16, // Usa um tamanho menor que o título.
                height: 1.5, // Facilita a leitura em mais de uma linha.
              ), // Fecha o estilo do subtítulo.
            ), // Fecha o texto do subtítulo.
            const SizedBox(
                height: 24), // Separa a apresentação da lista de eventos.
            const ListaEventos(), // Exibe os três cards abaixo da apresentação.
            const SizedBox(
                height: 24), // Separa os eventos do formulário da aula.
            TextField(
              // Cria uma caixa de entrada com fundo branco.
              style: const TextStyle(
                  color: Colors.black), // Define a cor do texto digitado.
              cursorColor:
                  Colors.black, // Mantém o cursor visível no fundo branco.
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do item',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              // Cria uma caixa de entrada com fundo branco.
              style: const TextStyle(
                  color: Colors.black), // Define a cor do texto digitado.
              cursorColor:
                  Colors.black, // Mantém o cursor visível no fundo branco.
              controller: _quantidadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantidade',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _adicionarItem,
              child: const Text('Adicionar'),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap:
                  true, // Ajusta a altura da lista à quantidade de itens.
              physics:
                  const NeverScrollableScrollPhysics(), // Usa a rolagem da página inteira.
              itemCount: _itens.length,
              itemBuilder: (context, index) {
                final item = _itens[index];
                return Card(
                  // Cria a caixa de cada item da lista.
                  color: Colors.white, // Define o fundo branco da caixa.
                  surfaceTintColor: Colors
                      .transparent, // Mantém o fundo branco sem tonalidade extra.
                  elevation: 0, // Remove a sombra da caixa.
                  shape: const RoundedRectangleBorder(
                    // Configura o formato da caixa.
                    side: BorderSide(
                        color: Colors.black), // Define a borda preta.
                    borderRadius: BorderRadius.all(
                        Radius.circular(12)), // Arredonda os cantos da caixa.
                  ), // Fecha o formato da caixa.
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.nome,
                            style: const TextStyle(
                                color: Colors
                                    .black)), // Exibe o nome em preto na caixa branca.
                        Row(
                          children: [
                            Text('Qtd: ${item.quantidade}',
                                style: const TextStyle(
                                    color: Colors
                                        .black)), // Exibe a quantidade em preto.
                            IconButton(
                              icon: const Icon(Icons.delete_outline,
                                  color: Colors
                                      .black), // Mantém o ícone visível na caixa branca.
                              onPressed: () => _removerItem(index),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
