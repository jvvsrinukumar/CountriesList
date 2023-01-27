
class CountriesList {
    CountriesList({
        required this.alpha2Code,
        required this.alpha3Code,
        required this.altSpellings,
        this.area,
        required this.borders,
        required this.callingCodes,
        required this.capital,
        required this.currencies,
        required this.demonym,
        required this.flagPng,
        this.gini,
        required this.languages,
        required this.latlng,
        required this.name,
        required this.nativeName,
        this.numericCode,
        required this.population,
        required this.region,
        required this.regionalBlocs,
        required this.subregion,
        required this.timezones,
        required this.topLevelDomain,
        required this.translations,
        this.cioc,
        this.flag,
    });

    String alpha2Code;
    String alpha3Code;
    List<String> altSpellings;
    double? area;
    List<String> borders;
    List<String> callingCodes;
    String capital;
    List<Currency> currencies;
    String demonym;
    String flagPng;
    double? gini;
    List<Language> languages;
    List<double> latlng;
    String name;
    String nativeName;
    String? numericCode;
    int population;
    String region;
    List<RegionalBloc> regionalBlocs;
    String subregion;
    List<String> timezones;
    List<String> topLevelDomain;
    Translations translations;
    String? cioc;
    String? flag;

    factory CountriesList.fromJson(Map<String, dynamic> json) => CountriesList(
        alpha2Code: json["alpha2Code"],
        alpha3Code: json["alpha3Code"],
        altSpellings: List<String>.from(json["altSpellings"].map((x) => x)),
        area: json["area"]?.toDouble(),
        borders: List<String>.from(json["borders"].map((x) => x)),
        callingCodes: List<String>.from(json["callingCodes"].map((x) => x)),
        capital: json["capital"],
        currencies: List<Currency>.from(json["currencies"].map((x) => Currency.fromJson(x))),
        demonym: json["demonym"],
        flagPng: json["flagPNG"],
        gini: json["gini"]?.toDouble(),
        languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
        latlng: List<double>.from(json["latlng"].map((x) => x?.toDouble())),
        name: json["name"],
        nativeName: json["nativeName"],
        numericCode: json["numericCode"],
        population: json["population"],
        region: json["region"],
        regionalBlocs: List<RegionalBloc>.from(json["regionalBlocs"].map((x) => RegionalBloc.fromJson(x))),
        subregion: json["subregion"],
        timezones: List<String>.from(json["timezones"].map((x) => x)),
        topLevelDomain: List<String>.from(json["topLevelDomain"].map((x) => x)),
        translations: Translations.fromJson(json["translations"]),
        cioc: json["cioc"],
        flag: json["flag"],
    );

    Map<String, dynamic> toJson() => {
        "alpha2Code": alpha2Code,
        "alpha3Code": alpha3Code,
        "altSpellings": List<dynamic>.from(altSpellings.map((x) => x)),
        "area": area,
        "borders": List<dynamic>.from(borders.map((x) => x)),
        "callingCodes": List<dynamic>.from(callingCodes.map((x) => x)),
        "capital": capital,
        "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
        "demonym": demonym,
        "flagPNG": flagPng,
        "gini": gini,
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
        "name": name,
        "nativeName": nativeName,
        "numericCode": numericCode,
        "population": population,
        "region": region,
       // "regionalBlocs": List<dynamic>.from(regionalBlocs.map((x) => x.toJson())),
        "subregion": subregion,
        "timezones": List<dynamic>.from(timezones.map((x) => x)),
        "topLevelDomain": List<dynamic>.from(topLevelDomain.map((x) => x)),
        "translations": translations.toJson(),
        "cioc": cioc,
        "flag": flag,
    };
}

class Currency {
    Currency({
        this.code,
        this.name,
        this.symbol,
    });

    String? code;
    String? name;
    String? symbol;

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"],
        name: json["name"],
        symbol: json["symbol"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "symbol": symbol,
    };
}

class Language {
    Language({
        this.iso6391,
        required this.iso6392,
        required this.name,
        required this.nativeName,
    });

    String? iso6391;
    String iso6392;
    String name;
    String nativeName;

    factory Language.fromJson(Map<String, dynamic> json) => Language(
        iso6391: json["iso639_1"],
        iso6392: json["iso639_2"],
        name: json["name"],
        nativeName: json["nativeName"],
    );

    Map<String, dynamic> toJson() => {
        "iso639_1": iso6391,
        "iso639_2": iso6392,
        "name": name,
        "nativeName": nativeName,
    };
}


class RegionalBloc {
    RegionalBloc({
        required this.acronym,
        required this.name,
        this.otherNames,
        this.otherAcronyms,
    });

    String acronym;
    String name;
    List<String>? otherNames;
    List<String>? otherAcronyms;

    factory RegionalBloc.fromJson(Map<String, dynamic> json) => RegionalBloc(
        acronym: json["acronym"],
        name: json["name"],
        otherNames: json["otherNames"] == null ? [] : List<String>.from(json["otherNames"].map((x) => x)),
        otherAcronyms: json["otherAcronyms"] == null ? [] : List<String>.from(json["otherAcronyms"].map((x) => x)),

    );
}

class Translations {
    Translations({
        required this.br,
        this.de,
        this.es,
        required this.fa,
        this.fr,
        this.hr,
        this.it,
        this.ja,
        this.nl,
        required this.pt,
    });

    String br;
    String? de;
    String? es;
    String fa;
    String? fr;
    String? hr;
    String? it;
    String? ja;
    String? nl;
    String pt;

    factory Translations.fromJson(Map<String, dynamic> json) => Translations(
        br: json["br"],
        de: json["de"],
        es: json["es"],
        fa: json["fa"],
        fr: json["fr"],
        hr: json["hr"],
        it: json["it"],
        ja: json["ja"],
        nl: json["nl"],
        pt: json["pt"],
    );

    Map<String, dynamic> toJson() => {
        "br": br,
        "de": de,
        "es": es,
        "fa": fa,
        "fr": fr,
        "hr": hr,
        "it": it,
        "ja": ja,
        "nl": nl,
        "pt": pt,
    };
}


