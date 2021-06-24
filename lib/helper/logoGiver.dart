var teams = [
  {
    'name': 'AC Milan',
    'url':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Logo_of_AC_Milan.svg/130px-Logo_of_AC_Milan.svg.png'
  },{
    'name': 'Milan',
    'url':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Logo_of_AC_Milan.svg/130px-Logo_of_AC_Milan.svg.png'
  },
  {
    'name': 'Atalanta',
    'url':
        'https://upload.wikimedia.org/wikipedia/en/thumb/6/66/AtalantaBC.svg/150px-AtalantaBC.svg.png'
  },
  {
    'name': 'Benevento',
    'url':
        'https://upload.wikimedia.org/wikipedia/en/thumb/6/61/Benevento_Calcio_logo.svg/200px-Benevento_Calcio_logo.svg.png'
  },
  {
    'name': 'Bologna',
    'url':
        'https://upload.wikimedia.org/wikipedia/en/thumb/5/5b/Bologna_F.C._1909_logo.svg/150px-Bologna_F.C._1909_logo.svg.png'
  },
  {
    'name': 'Cagliari',
    'url':
        'https://upload.wikimedia.org/wikipedia/en/thumb/6/61/Cagliari_Calcio_1920.svg/150px-Cagliari_Calcio_1920.svg.png'
  },
  {
    'name': 'Crotone',
    'url':
        'https://upload.wikimedia.org/wikipedia/en/thumb/d/db/FC_Crotone_logo.svg/150px-FC_Crotone_logo.svg.png'
  },
  {
    'name': 'Fiorentina',
    'url':
        'https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/ACF_Fiorentina_2.svg/150px-ACF_Fiorentina_2.svg.png'
  },
  {
    'name': 'Genoa',
    'url':
        'https://upload.wikimedia.org/wikipedia/en/thumb/6/6c/Genoa_C.F.C._logo.svg/175px-Genoa_C.F.C._logo.svg.png'
  },
  {
    'name': 'Hellas Verona',
    'url':
        'https://upload.wikimedia.org/wikipedia/en/thumb/9/92/Hellas_Verona_FC_logo_%282020%29.svg/180px-Hellas_Verona_FC_logo_%282020%29.svg.png'
  },{
    'name': 'Verona',
    'url':
        'https://upload.wikimedia.org/wikipedia/en/thumb/9/92/Hellas_Verona_FC_logo_%282020%29.svg/180px-Hellas_Verona_FC_logo_%282020%29.svg.png'
  },
  {
    'name': 'Inter',
    'url':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/FC_Internazionale_Milano_2014.svg/180px-FC_Internazionale_Milano_2014.svg.png'
  },
  {
    'name': 'Juventus',
    'url':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Juventus_FC_2017_icon_%28black%29.svg/110px-Juventus_FC_2017_icon_%28black%29.svg.png'
  },
  {
    'name': 'Lazio',
    'url':
        'https://upload.wikimedia.org/wikipedia/en/thumb/c/ce/S.S._Lazio_badge.svg/220px-S.S._Lazio_badge.svg.png'
  },
  {
    'name': 'Parma Calcio 1913',
    'url':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Logo_Parma_Calcio_1913_%28adozione_2016%29.svg/170px-Logo_Parma_Calcio_1913_%28adozione_2016%29.svg.png'
  },
  {
    'name': 'Roma',
    'url':
        'https://upload.wikimedia.org/wikipedia/en/thumb/f/f7/AS_Roma_logo_%282017%29.svg/180px-AS_Roma_logo_%282017%29.svg.png'
  },
  {
    'name': 'Sampdoria',
    'url':
        'https://upload.wikimedia.org/wikipedia/en/thumb/d/d2/U.C._Sampdoria_logo.svg/175px-U.C._Sampdoria_logo.svg.png'
  },
  {
    'name': 'Sassuolo',
    'url':
        'https://upload.wikimedia.org/wikipedia/en/thumb/1/1c/US_Sassuolo_Calcio_logo.svg/200px-US_Sassuolo_Calcio_logo.svg.png'
  },
  {
    'name': 'Spezia',
    'url':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Spezia_Calcio.svg/170px-Spezia_Calcio.svg.png'
  },
  {
    'name': 'SSC Napoli',
    'url':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/SSC_Neapel.svg/180px-SSC_Neapel.svg.png'
  },{
    'name': 'Napoli',
    'url':
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/SSC_Neapel.svg/180px-SSC_Neapel.svg.png'
  },
  {
    'name': 'Torino',
    'url':
        'https://upload.wikimedia.org/wikipedia/en/thumb/2/2e/Torino_FC_Logo.svg/170px-Torino_FC_Logo.svg.png'
  },
  {
    'name': 'Udinese',
    'url':
        'https://upload.wikimedia.org/wikipedia/en/thumb/c/ce/Udinese_Calcio_logo.svg/175px-Udinese_Calcio_logo.svg.png'
  }
];

getLogo(tm) {
  for (Map team in teams) {
    if (tm == team['name']) {
      return team['url'];
    }
  }
  return 'https://zebrazonefc.com/wp-content/uploads/2020/11/unknown-team.png';
}
