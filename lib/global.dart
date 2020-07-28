const API_KEY = "ed051d1f51004160bdeb08f5a95adb64";

const String BASE_URL = "https://newsapi.org/v2";
const String TOP_HEADLINES = "top-headlines";
// const String COUNTRY = "country";

const String TOP_HEADLINE =
    "https://newsapi.org/v2/$TOP_HEADLINES?country=in&apiKey=$API_KEY";

categoryWiseSearch(String category) {
  return "$BASE_URL/$TOP_HEADLINES?country=in&category=$category&apiKey=$API_KEY";
}
