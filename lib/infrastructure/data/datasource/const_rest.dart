class ConstRest {
  ///WARNING ! ESTO CLARAMENTE ES UNA MALA PRACTICA DEBERIA DE ESTAR
  ///EN UN SERVIDOR SEGURO O FIRESTORE, SE REALIZA DE ESTA MANERA POR
  ///CUESTIONES DE TIEMPO, pongo sss para disumular aunque de poco sirve.
  static const sss = "8980390b40b3a776eb05dd067977e723";

  ////API MOVIES/////
  static const baseUrl = "https://api.themoviedb.org/3/tv/";

  static const getPopularMovies = "popular";

  static const getRecomentationsMovies = "top_rated";

  static const getTvAiringTodayMovies = "airing_today";

  static const getSeason = "/season/";

  static const getEpisode = "/episode/";
}
