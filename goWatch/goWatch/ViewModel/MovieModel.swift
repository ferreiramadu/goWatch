import UIKit
import Foundation

class MovieModel {
    private var listMovie: [Movie] = []
    private var listSearch: [Movie] = []
    private var categoryModel: CategoryModel = CategoryModel()
    private var actorModel: ActorModel = ActorModel()
    
    init() {
        self.getAllMovies()
    }
    
    public func getAllMovies() {
        listMovie.append(Movie(
            id: 0,
            title: "Raya e o último dragão",
            synopsis: "Há muito tempo, no mundo de fantasia de Kumandra, humanos e dragões viviam juntos em harmonia. Mas quando uma força maligna ameaçou a terra, os dragões se sacrificaram para salvar a humanidade. Agora, 500 anos depois, o mesmo mal voltou e cabe a uma guerreira solitária, Raya, rastrear o lendário último dragão para restaurar a terra despedaçada e seu povo dividido.",
            year: 2011,
            banner: UIImage(named: "card-raya") ?? UIImage(),
            background: UIImage(named: "background-raya") ?? UIImage(),
            category: categoryModel.findById(Index: 0),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 2105,
            splash: UIImage(named: "splash-raya") ?? UIImage())
        )
        listMovie.append(Movie(
            id: 1,
            title: "Como Treinar o Seu Dragão",
            synopsis: "Soluço é um adolescente viking da ilha de Berk, onde lutar contra dragões é um meio de vida. Suas opiniões avançadas e um senso de humor estranho o tornam um desajustado, apesar de seu pai ser o chefe do clã. Jogado em uma escola de combate a dragões, ele quer provar que é um verdadeiro viking, mas ao fazer amizade com um dragão machucado, ele tem a chance de mudar o futuro de seu povo.",
            year: 2010,
            banner: UIImage(named: "card-dragao") ?? UIImage(),
            background:  UIImage(named: "background-dragao") ?? UIImage(),
            category: categoryModel.findById(Index: 0),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 2100,
            splash: UIImage(named: "splash-dragao") ?? UIImage())
        )
        listMovie.append(Movie(
            id: 2,
            title: "Justiceiras",
            synopsis: "O mundo de Drea, a garota mais popular de uma escola de elite, desaba quando seu namorado vaza um vídeo íntimo seu. Furiosa, ela se une à excluída Eleanor, e as duas buscam vingança contra seus inimigos.",
            year: 2022,
            banner: UIImage(named: "card-justiceiras") ?? UIImage(),
            background:  UIImage(named: "background-justiceiras") ?? UIImage(),
            category: categoryModel.findById(Index: 1),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 2100,
            splash: UIImage(named: "splash-justiceira") ?? UIImage())
        )
        listMovie.append(Movie(
            id: 3,
            title: "Homem-aranha: Longe de casa",
            synopsis: "Peter Parker está em uma viagem de duas semanas pela Europa, ao lado de seus amigos de colégio, quando é surpreendido pela visita de Nick Fury. Convocado para mais uma missão heroica, ele precisa enfrentar vários vilões que surgem em cidades-símbolo do continente, como Londres, Paris e Veneza, e também a aparição do enigmático Mysterio.",
            year: 2022,
            banner: UIImage(named: "card-aranha") ?? UIImage(),
            background:  UIImage(named: "background-aranha") ?? UIImage(),
            category: categoryModel.findById(Index: 2),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 2100,
            splash:  UIImage(named: "splash-aranha") ?? UIImage())
        )
        listMovie.append(Movie(
            id: 4,
            title: "Alerta vermelho",
            synopsis: "Em Alerta Vermelho, num mundo de crimes internacionais, quando a Interpol emite o alerta vermelho, o melhor investigador do FBI, John Hartley (Dwayne Johnson) entra em cena para localizar e capturar um dos criminosos mais procurados do mundo, 'O Bispo' (Gal Gadot), a ladra mais bem sucedida em roubos de obras de arte do mundo inteiro e a mais procurada também. Para isso, Hartley precisará se unir com o pior dos piores, Nolan Booth (Ryan Reynolds), para se colocar em um ousado plano de assalto para capturar O Bispo. Esta grande aventura vai levar o trio ao redor do mundo, desde selvas até pistas de dança e prisão isolada, mas para isso terão que aguentar o pior de tudo constantemente um na companhia do outro. Mas quando se junta um investigador e dois ladrões tudo pode acontecer.",
            year: 2022,
            banner: UIImage(named: "card-alerta-vermelho") ?? UIImage(),
            background:  UIImage(named: "") ?? UIImage(),
            category: categoryModel.findById(Index: 1),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 5000,
            splash:  UIImage(named: "splash-alerta-vermelho") ?? UIImage())
        )
        listMovie.append(Movie(
            id: 5,
            title: "Pixels",
            synopsis: "A humanidade sempre buscou vida fora da Terra e, em busca de algum contato, enviou imagens e sons variados sobre a cultura terrestre nos mais diversos satélites já lançados no universo. Um dia, um deles foi encontrado. Disposta a conquistar o planeta, a raça alienígena resolveu criar monstros digitais inspirados em videogames clássicos dos anos 1980. Para combatê-los, a única alternativa é chamar especialistas nos jogos: Sam Brenner (Adam Sandler), Eddie Plant (Peter Dinklage), Ludlow Lamonsoff (Josh Gad) e a tenente-coronel Violet Van Patten (Michelle Monaghan).",
            year: 2022,
            banner: UIImage(named: "card-pixels") ?? UIImage(),
            background:  UIImage(named: "") ?? UIImage(),
            category: categoryModel.findById(Index: 1),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 50,
            splash:  UIImage(named: "") ?? UIImage())
        )
        listMovie.append(Movie(
            id: 6,
            title: "Mistério no mediterrâneo",
            synopsis: "Nick Spitz (Adam Sandler) é um policial que há tempos tenta se tornar detetive, mas nunca consegue passar na prova para o cargo. Envergonhado, ele diz para sua esposa (Jennifer Aniston) que trabalha na função, pedindo ao melhor amigo que o ajude nesta mentira. Um dia, ao chegar em casa, Nick é cobrado por Audrey sobre a sonhada viagem à Europa, prometida quando eles se casaram, 15 anos atrás. Pressionado, ele diz que já havia arrumado tudo e, assim, os dois partem em viagem. Ainda no avião, Audrey conhece o milionário Charles Cavendish (Luke Evans), que os convida para um tour a Mônaco a bordo do navio de seu tio (Terence Stamp). O casal aceita a oferta, sem imaginar que estaria envolvido com a investigação em torno de um assassinato em pleno alto-mar.",
            year: 2022,
            banner: UIImage(named: "card-misterio-no-mediterraneo") ?? UIImage(),
            background:  UIImage(named: "") ?? UIImage(),
            category: categoryModel.findById(Index: 1),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 50,
            splash:  UIImage(named: "") ?? UIImage())
        )
        listMovie.append(Movie(
            id: 7,
            title: "Encanto",
            synopsis: "Encanto é o novo filme de animação da Disney, situada na Colômbia. Nela, a família Madrigal e a comunidade em volta da casa da família é cercada por montanhas, que os deixam protegidos dos maus do mundo. Porém, a família Madrigal é dotada de magia, com cada um dos integrantes da família tendo algum poder mágico que é usado para ajudar a comunidade. Apesar da família ser dotada de magia, apenas um integrante dela não recebeu seu dom quando tinha cinco anos, Mirabel, que sempre tenta ajudar a família e a comunidade como consegue, mas não importa o que faça, ela nunca consegue agradar sua Abuela. Um dia, na noite em que um de seus primos recebe seus dons, ela vê a casa da família rachando, algo que é relevado pela família, já que ela não tem poderes mágicos. Mirabel então parte em uma aventura própria para achar o que há de errado com a casa e salvar todos de sua família, e o único que pode dar as respostas é seu tio Bruno, que vê o futuro. O único problema é que ele saiu um dia e nunca mais voltou.",
            year: 2022,
            banner: UIImage(named: "card-encanto") ?? UIImage(),
            background:  UIImage(named: "") ?? UIImage(),
            category: categoryModel.findById(Index: 0),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 50,
            splash:  UIImage(named: "") ?? UIImage())
        )
        listMovie.append(Movie(
            id: 8,
            title: "Os incríveis",
            synopsis: "Quando Helena Pêra é chamada para voltar a lutar contra o crime como a super-heroína Mulher-Elástica, cabe ao seu marido, Roberto, a tarefa de cuidar das crianças, especialmente o bebê Zezé. O que ele não esperava era que o caçula da família também tivesse superpoderes, que surgem sem qualquer controle.",
            year: 2022,
            banner: UIImage(named: "card-os-incriveis") ?? UIImage(),
            background:  UIImage(named: "") ?? UIImage(),
            category: categoryModel.findById(Index: 0),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 50,
            splash:  UIImage(named: "") ?? UIImage())
        )
        listMovie.append(Movie(
            id: 9,
            title: "Top Gun: Maverick",
            synopsis: "Na sequência de Top Gun: Ases Indomáveis, acompanhamos a história de Pete “Maverick” Mitchell (Tom Cruise), um piloto à moda antiga da Marinha que coleciona muitas condecorações, medalhas de combate e grande reconhecimento pela quantidade de aviões inimigos abatidos nos últimos 30 anos. Entretanto, nada disso foi suficiente para sua carreira decolar, visto que ele deixou de ser um capitão e tornou-se um instrutor. A explicação para esse declínio é simples: Ele continua sendo o mesmo piloto rebelde de sempre, que não hesita em romper os limites e desafiar a morte. Nesta nova aventura, Maverick precisa provar que o fator humano ainda é fundamental no mundo contemporâneo das guerras tecnológicas. Após 34 anos do clássico, acompanhem o filme do premiado produtor Jerry Bruckheimer e de Joseph Kosinski, mesmo diretor de Tron: O Legado (2010) e Oblivion (2013).",
            year: 2022,
            banner: UIImage(named: "card-maverick") ?? UIImage(),
            background:  UIImage(named: "") ?? UIImage(),
            category: categoryModel.findById(Index: 2),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 50,
            splash:  UIImage(named: "") ?? UIImage())
        )
        listMovie.append(Movie(
            id: 10,
            title: "Uncharted: Fora do mapa",
            synopsis: "Baseado em uma das séries de videogame mais vendidas e aclamadas pela crítica de todos os tempos, Uncharted: Fora do Mapa serve como uma prequela para os jogos, seguindo o jovem explorador Nathan 'Nate' Drake (Tom Holland), descendente do grande explorador Francis Drake, antes de ser conhecido como um famoso explorador. Mas antes disso, Nate vivia uma vida pacata como bartender em uma cidade, mas acaba se envolvendo com um estranho que viria ser um dos seus mais confiáveis companheiros. Uncharted: Fora do Mapa mostra sua primeira aventura de caça ao tesouro com o sagaz parceiro Victor 'Sully' Sullivan (Mark Wahlberg). Os dois partem em uma perigosa busca pelo 'maior tesouro nunca encontrado', na cidade sul americana de El Dorado, mas a aventura acaba se estendendo por todo o mundo, enquanto rastreiam pistas que podem levar ao irmão há muito perdido de Nathan. Porém, mal sabiam eles que seriam perseguidos por um grupo de mercenários que também buscam pelo tesouro perdido.",
            year: 2022,
            banner: UIImage(named: "card-uncharted") ?? UIImage(),
            background:  UIImage(named: "") ?? UIImage(),
            category: categoryModel.findById(Index: 2),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 50,
            splash:  UIImage(named: "") ?? UIImage())
        )
        listMovie.append(Movie(
            id: 11,
            title: "Jurassic World - O mundo dos dinossauros",
            synopsis: "O Jurassic Park, localizado na ilha Nublar, enfim está aberto ao público. Com isso, as pessoas podem conferir shows acrobáticos com dinossauros e até mesmo fazer passeios bem perto deles, já que agora estão domesticados. Entretanto, a equipe chefiada pela doutora Claire (Bryce Dallas Howard) passa a fazer experiências genéticas com estes seres, de forma a criar novas espécies. Uma delas logo adquire inteligência bem mais alta, logo se tornando uma grande ameaça para a existência humana.",
            year: 2022,
            banner: UIImage(named: "card-jurassic-world") ?? UIImage(),
            background:  UIImage(named: "") ?? UIImage(),
            category: categoryModel.findById(Index: 2),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 50,
            splash:  UIImage(named: "") ?? UIImage())
        )
        
        listMovie.append(Movie(
            id: 12,
            title: "It - A coisa",
            synopsis: "Em It - A Coisa, um grupo de sete adolescentes de Derry, uma cidade no Maine, formam o auto-intitulado 'Losers Club' - o clube dos perdedores. A pacata rotina da cidade é abalada quando crianças começam a desaparecer e tudo o que pode ser encontrado delas são partes de seus corpos. Logo, os integrantes do 'Losers Club' acabam ficando face a face com o responsável pelos crimes: o palhaço Pennywise.",
            year: 2022,
            banner: UIImage(named: "card-it") ?? UIImage(),
            background:  UIImage(named: "") ?? UIImage(),
            category: categoryModel.findById(Index: 4),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 50,
            splash:  UIImage(named: "") ?? UIImage())
        )
        listMovie.append(Movie(
            id: 13,
            title: "A orfã",
            synopsis: "Kate (Vera Farmiga) e John Coleman (Peter Sarsgaard) ficam arrasados devido a um trágico aborto. Apesar de já ter dois filhos, Daniel (Jimmy Bennett) e a surda muda Maxime (Aryana Engineer), o casal decide adotar uma criança. Durante uma visita a um orfanato, os dois se encantam pela pequena Esther (Isabelle Fuhrman) de nove anos e optam rapidamente por sua adoção. O que eles não sabiam é que estranhos acontecimentos fazem parte do histórico da menina que passa a se tornar, dia após dia, mais misteriosa. Intrigada, Kate desconfia que Esther não é quem aparenta ser, mas devido ao seu passado de alcoolismo tem dificuldades de provar sua teoria.",
            year: 2022,
            banner: UIImage(named: "card-a-orfa") ?? UIImage(),
            background:  UIImage(named: "") ?? UIImage(),
            category: categoryModel.findById(Index: 4),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 50,
            splash:  UIImage(named: "") ?? UIImage())
        )
        listMovie.append(Movie(
            id: 14,
            title: "A Freira",
            synopsis: "Fazendo parte da franquia Invocação do Mal, em A Freira, após uma irmã cometer suicídio em um convento na Romênia, o Vaticano envia um padre atormentado e uma noviça para investigar o ocorrido. Arriscando suas vidas, a fé e até suas almas, os dois descobrem um segredo profano no local, confrontando-se com uma força do mal que toma a forma de uma freira demoníaca e transforma o convento num campo de batalha espiritual.",
            year: 2022,
            banner: UIImage(named: "card-a-freira") ?? UIImage(),
            background:  UIImage(named: "") ?? UIImage(),
            category: categoryModel.findById(Index: 4),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 50,
            splash:  UIImage(named: "") ?? UIImage())
        )
        listMovie.append(Movie(
            id: 15,
            title: "Pânico",
            synopsis: "Pânico é a quinta parte da franquia clássica de terror iniciada nos anos 90, sendo uma sequência direta dos acontecimentos do filme de 2011, que mostrará uma mulher voltando para sua cidade natal e tentando descobrir quem está cometendo os atuais crimes cruéis, vinte e cinco anos depois que uma série de assassinatos brutais chocou a pacata cidade de Woodsboro, na Califórnia. Agora um novo assassino veste a máscara do Ghostface e começa a mirar em um grupo de adolescentes, o que será capaz de ressuscitar segredos do passado mortal da cidade, além de reacender traumas nos sobreviventes, que, novamente, precisaram enfrentar essa ameaça obscura e violenta.",
            year: 2022,
            banner: UIImage(named: "card-panico") ?? UIImage(),
            background:  UIImage(named: "") ?? UIImage(),
            category: categoryModel.findById(Index: 4),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 50,
            splash:  UIImage(named: "") ?? UIImage())
        )
        listMovie.append(Movie(
            id: 16,
            title: "Amor em verona",
            synopsis: "Em Amor em Verona, uma professora de inglês é apaixonada pela trágica história de Romeu e Julieta. Por conta disso ela decide juntar todas as suas economias para ficar uma semana em Verona, local aonde a peça de Shakespeare se passa. Ela organiza uma itinerário completo para ela e seu namorado, mas às vésperas de sua viagem ele pede o término do relacionamento. Sem se abalar ela continua a viagem, onde muitas coisas dão errado ao longo do caminho. Uma delas é seu airbnb, que foi sofreu uma reserva dupla e um de seus viajantes é um inglês que foi para a cidade por conta de um festival de vinhos. Ainda querendo que tudo se resolva, o proprietário do local sugere que ambos compartilhem a villa, apenas não esperando que os dois poderiam virar os próprios Capuletos e Montéquios do local. Em uma briga para quem sai primeiro, talvez a própria Julieta possa fazer com que ambos se apaixonem na cidade do amor.",
            year: 2022,
            banner: UIImage(named: "card-amor-em-verona") ?? UIImage(),
            background:  UIImage(named: "") ?? UIImage(),
            category: categoryModel.findById(Index: 3),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 50,
            splash:  UIImage(named: "") ?? UIImage())
        )
        listMovie.append(Movie(
            id: 17,
            title: "O date perfeito",
            synopsis: "Precisando de dinheiro para pagar pela faculdade, Brooks (Noah Centineo) decide criar um aplicativo que permite contratar um namorado para todo tipo de situação imaginável. Porém, adotar uma personalidade e um par romântico diferente para cada dia começa a se mostrar uma tarefa difícil e ele começa a se perguntar quem ele é de verdade e como pode encontrar o amor verdadeiro.",
            year: 2022,
            banner: UIImage(named: "card-date-perfeito") ?? UIImage(),
            background:  UIImage(named: "") ?? UIImage(),
            category: categoryModel.findById(Index: 3),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 50,
            splash:  UIImage(named: "") ?? UIImage())
        )
        listMovie.append(Movie(
            id: 18,
            title: "Uma quedinha de natal",
            synopsis: "Em Uma Quedinha de Natal, Sierra Belmont (Lindsay Lohan) é uma garota mimada e herdeira de uma rede de hotéis espalhados pelo mundo, mas nada interessada em fazer parte do negócio do pai, apenas compras e viagens. Em uma saída com seu namorado, ela é surpreendida quando Tad a pede em casamento. O choque é grande, e faz com que ela acabe sofrendo um acidente e perde a memória no processo - além de se separar do namorado enquanto caía. Ela é então resgatada por uma viatura e levada a um hospital. Mas, como ninguém vêm a sua procura e não conseguem a identificar, Sierra acaba sendo admitida no Northstar Lodge por Jake Russell, um dono de hotel que mais cedo havia tentado fechar um negócio com seu pai. Sierra, assumindo o nome de Sarah, ajuda Jake a fazer uma festa de final de ano para conseguir fundos para o hotel.",
            year: 2022,
            banner: UIImage(named: "card-uma-quedinha-de-natal") ?? UIImage(),
            background:  UIImage(named: "") ?? UIImage(),
            category: categoryModel.findById(Index: 3),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 50,
            splash:  UIImage(named: "") ?? UIImage())
        )
        listMovie.append(Movie(
            id: 19,
            title: "Persuasão",
            synopsis: "Há alguns anos atrás, a jovem Annie Elliott (Sally Hawkins) se apaixonou pelo oficial Frederick Wentworth (Rupert Penry-Jones). Mas, devido a condição financeira dele e as restrições da família da moça, Annie é persuadida a romper o relacionamento. Oito anos depois, Wentworth retorna a cidade com uma reputação e situação econômica bem mais elevada. Mesmo após todo esse tempo, Annie nunca deixou de amá-lo, mas terá de lidar com o fascínio das moças solteiras por Frederick.",
            year: 2022,
            banner: UIImage(named: "card-persuasao") ?? UIImage(),
            background:  UIImage(named: "") ?? UIImage(),
            category: categoryModel.findById(Index: 3),
            cast: [actorModel.findById(Index: 0), actorModel.findById(Index: 1)],
            numberOfLikes: 50,
            splash:  UIImage(named: "") ?? UIImage())
        )
    }
    
    public var countElements: Int {
        return self.listMovie.count
    }
    
    public var countElementsFilter : Int {
        return self.listSearch.count
    }
    
    public func findById(Index: Int) -> Movie {
        return self.listMovie[Index]
    }
    
    public func findByCategory(id: Int) -> [Movie] {
        var list: [Movie] = []

        for movie in self.listMovie {
            if (movie.category.id == id) {
                list.append(movie)
            }
        }
    
        return list
    }
    
    public func findAll() -> [Movie] {
        return listMovie
    }
    
    public func findSearch() -> [Movie] {
        return listSearch
    }
    
    public func clearSearch() {
        return self.listSearch = []
    }
    
    public func mostLiked() -> [Movie] {
        var list: [Movie] = []
        for movie in self.listMovie {
            if (list.count < 5) {
                list.append(movie)
            }
        }
        
        return list.sorted(by: { $0.numberOfLikes > $1.numberOfLikes })
    }
    
    public func findByTitle(title: String) {
        var list: [Movie] = []
        
        for movie in self.listMovie {
            if (list.isEmpty) {
                if (movie.title.starts(with: title)) {
                    list.append(movie)
                }
            } else {
                for movieAdd in list {
                    if (movie.title.starts(with: title) && movie.id != movieAdd.id) {
                        list.append(movie)
                    }
                }
            }
        }
        
        listSearch = list
    }
}
