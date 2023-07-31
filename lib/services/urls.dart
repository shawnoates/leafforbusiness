class URLs {
  static String baseUrl() {
    /// @important disabled for now, can be used for debugging mode
    // if (AppEnv.env == Env.local) {
    //   return "http://127.0.0.1:5001/leaf-for-business/us-central1/api";
    // }
    return "https://us-central1-leaf-for-business.cloudfunctions.net/api";
  }
}
