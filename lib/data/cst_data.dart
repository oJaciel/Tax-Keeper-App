//Dados para os componentes de CST

//ICMS

//TABELA A - ORIGEM DA MERCADORIA OU SERVIÇO
final cstIcmsA = [
  {'cod': '0', 'desc': 'Nacional, exceto as indicadas nos códigos 3 a 5'},
  {
    'cod': '1',
    'desc': 'Estrangeira - Importação direta, exceto a indicada no código 6',
  },
  {
    'cod': '2',
    'desc':
        'Estrangeira - Adquirida no mercado interno, exceto a indicada no código 7',
  },
  {
    'cod': '3',
    'desc':
        'Nacional, mercadoria ou bem com Conteúdo de Importação superior a 40%',
  },
  {
    'cod': '4',
    'desc':
        'Nacional, produção conforme processos produtivos básicos das leis específicas',
  },
  {
    'cod': '5',
    'desc':
        'Nacional, mercadoria ou bem com Conteúdo de Importação inferior ou igual a 40%',
  },
  {
    'cod': '6',
    'desc':
        'Estrangeira - Importação direta, sem similar nacional, constante em lista de Resolução Camex e gás natural',
  },
  {
    'cod': '7',
    'desc':
        'Estrangeira - Adquirida no mercado interno, sem similar nacional, constante em lista de Resolução Camex e gás natural',
  },
];

//TABELA B - TRIBUTAÇÃO PELO ICMS
final cstIcmsB = [
  {'cod': '00', 'desc': 'Tributada integralmente'},
  {
    'cod': '10',
    'desc': 'Tributada e com cobrança do ICMS por substituição tributária',
  },
  {'cod': '20', 'desc': 'Com redução de base de cálculo'},
  {
    'cod': '30',
    'desc':
        'Isenta ou não tributada e com cobrança do ICMS por substituição tributária',
  },
  {'cod': '40', 'desc': 'Isenta'},
  {'cod': '41', 'desc': 'Não tributada'},
  {'cod': '50', 'desc': 'Suspensão'},
  {'cod': '51', 'desc': 'Diferimento'},
  {
    'cod': '60',
    'desc': 'ICMS cobrado anteriormente por substituição tributária',
  },
  {
    'cod': '70',
    'desc':
        'Com redução de base de cálculo e cobrança do ICMS por substituição tributária',
  },
  {'cod': '90', 'desc': 'Outras'},
];

//PIS / COFINS
final cstPisCofins = [
  {'cod': '01', 'desc': 'Operação Tributável com Alíquota Básica'},
  {'cod': '02', 'desc': 'Operação Tributável com Alíquota Diferenciada'},
  {
    'cod': '03',
    'desc': 'Operação Tributável com Alíquota por Unidade de Medida de Produto',
  },
  {
    'cod': '04',
    'desc': 'Operação Tributável Monofásica – Revenda a Alíquota Zero',
  },
  {'cod': '05', 'desc': 'Operação Tributável por Substituição Tributária'},
  {'cod': '06', 'desc': 'Operação Tributável a Alíquota Zero'},
  {'cod': '07', 'desc': 'Operação Isenta da Contribuição'},
  {'cod': '08', 'desc': 'Operação sem Incidência da Contribuição'},
  {'cod': '09', 'desc': 'Operação com Suspensão da Contribuição'},
  {'cod': '49', 'desc': 'Outras Operações de Saída'},
  {
    'cod': '50',
    'desc':
        'Operação com Direito a Crédito – Vinculada Exclusivamente a Receita Tributada no Mercado Interno',
  },
  {
    'cod': '51',
    'desc':
        'Operação com Direito a Crédito – Vinculada Exclusivamente a Receita Não-Tributada no Mercado Interno',
  },
  {
    'cod': '52',
    'desc':
        'Operação com Direito a Crédito – Vinculada Exclusivamente a Receita de Exportação',
  },
  {
    'cod': '53',
    'desc':
        'Operação com Direito a Crédito – Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno',
  },
  {
    'cod': '54',
    'desc':
        'Operação com Direito a Crédito – Vinculada a Receitas Tributadas no Mercado Interno e de Exportação',
  },
  {
    'cod': '55',
    'desc':
        'Operação com Direito a Crédito – Vinculada a Receitas Não Tributadas no Mercado Interno e de Exportação',
  },
  {
    'cod': '56',
    'desc':
        'Operação com Direito a Crédito – Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno e de Exportação',
  },
  {
    'cod': '60',
    'desc':
        'Crédito Presumido – Operação de Aquisição Vinculada Exclusivamente a Receita Tributada no Mercado Interno',
  },
  {
    'cod': '61',
    'desc':
        'Crédito Presumido – Operação de Aquisição Vinculada Exclusivamente a Receita Não-Tributada no Mercado Interno',
  },
  {
    'cod': '62',
    'desc':
        'Crédito Presumido – Operação de Aquisição Vinculada Exclusivamente a Receita de Exportação',
  },
  {
    'cod': '63',
    'desc':
        'Crédito Presumido – Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno',
  },
  {
    'cod': '64',
    'desc':
        'Crédito Presumido – Operação de Aquisição Vinculada a Receitas Tributadas no Mercado Interno e de Exportação',
  },
  {
    'cod': '65',
    'desc':
        'Crédito Presumido – Operação de Aquisição Vinculada a Receitas Não-Tributadas no Mercado Interno e de Exportação',
  },
  {
    'cod': '66',
    'desc':
        'Crédito Presumido – Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno e de Exportação',
  },
  {'cod': '67', 'desc': 'Crédito Presumido – Outras Operações'},
  {'cod': '70', 'desc': 'Operação de Aquisição sem Direito a Crédito'},
  {'cod': '71', 'desc': 'Operação de Aquisição com Isenção'},
  {'cod': '72', 'desc': 'Operação de Aquisição com Suspensão'},
  {'cod': '73', 'desc': 'Operação de Aquisição a Alíquota Zero'},
  {'cod': '74', 'desc': 'Operação de Aquisição sem Incidência da Contribuição'},
  {'cod': '75', 'desc': 'Operação de Aquisição por Substituição Tributária'},
  {'cod': '98', 'desc': 'Outras Operações de Entrada'},
  {'cod': '99', 'desc': 'Outras Operações'},
];

// IPI
final cstIpi = [
  {'cod': '00', 'desc': 'Entrada com Recuperação de Crédito'},
  {'cod': '01', 'desc': 'Entrada Tributável com Alíquota Zero'},
  {'cod': '02', 'desc': 'Entrada Isenta'},
  {'cod': '03', 'desc': 'Entrada Não-Tributada'},
  {'cod': '04', 'desc': 'Entrada Imune'},
  {'cod': '05', 'desc': 'Entrada com Suspensão'},
  {'cod': '49', 'desc': 'Outras Entradas'},
  {'cod': '50', 'desc': 'Saída Tributada'},
  {'cod': '51', 'desc': 'Saída Tributável com Alíquota Zero'},
  {'cod': '52', 'desc': 'Saída Isenta'},
  {'cod': '53', 'desc': 'Saída Não-Tributada'},
  {'cod': '54', 'desc': 'Saída Imune'},
  {'cod': '55', 'desc': 'Saída com Suspensão'},
  {'cod': '99', 'desc': 'Outras Saídas'},
];
