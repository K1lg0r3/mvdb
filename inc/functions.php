<?php

//FUNCTION TO EXECUTE pdo
function execute_sql( $requestSql , $expression ){
    $pdoStatement = $pdo -> prepare( $requestSql );
    $token = '%'.$expression.'%';
    $pdoStatement -> bindValue( ':expression' , $token );
    if ( $pdoStatement -> execute() === false ){
        print_r( $pdoStatement -> errorInfo() );
    }
    else {
        return $pdoStatement -> fetchAll(PDO::FETCH_ASSOC);
    }
}

//FUNCTION TO SEARCH IN THE DB
function LookFor($expression){
    $sql_actors = 'SELECT * FROM movie
        WHERE mov_actors LIKE :expression';
    $sql_directors = 'SELECT * FROM movie
        WHERE mov_directors LIKE :expression';
    $sql_location = 'SELECT * FROM movie
        WHERE mov_location LIKE :expression';
    $sql_date = 'SELECT * FROM movie
        WHERE mov_release_date LIKE :expression';
    $sql_title = 'SELECT * FROM movie
        WHERE mov_title LIKE :expression';
    $sql_country = 'SELECT * FROM movie
        LEFT JOIN country ON country.cou_id = movie.country_cou_id
        WHERE country.cou_name LIKE :expression';
    $sql_genre = 'SELECT * FROM movie
        LEFT JOIN genre_has_movie ON genre.movie_mov_id = movie.mov_id
        LEFT JOIN genre ON genre.gen_id = genre_has_movie.genre_gen_id
        WHERE genre.gen_name LIKE :expression';
    $sql_language = 'SELECT * FROM movie
        LEFT JOIN language ON language.lan_id = movie.language_lan_id
        WHERE language.lan_name LIKE :expression';
    $sql_medium = 'SELECT * FROM movie
        LEFT JOIN medium ON medium.med_id = movie.medium_med_id
        WHERE medium.med_name LIKE :expression';

    $ByActors = execute_sql( $sql_actors , $expression );
    $ByDirectors = execute_sql( $sql_directors , $expression );
    $ByLocation = execute_sql( $sql_location , $expression );
    $ByDate = execute_sql( $sql_date , $expression );
    $ByTitle = execute_sql( $sql_title , $expression );
    $ByCountry = execute_sql( $sql_country , $expression );
    $ByGenre = execute_sql( $sql_genre , $expression );
    $ByLanguage = execute_sql( $sql_language , $expression );
    $ByMedium = execute_sql( $sql_medium , $expression );

    $ArrayResultats = array(
        'actors' => $ByActors,
        'directors' => $ByDirectors,
        'location' => $ByLocation,
        'date' => $ByDate,
        'title' => $ByTitle,
        'country' => $ByCountry,
        'genre' => $ByGenre,
        'language' => $ByLanguage,
        'medium' => $ByMedium
    );

    $jayson = json_encode( $ArrayResultats );
    return $jayson;
}

?>
