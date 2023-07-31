enum Env {
  local,
  stage,
  prod,
}

class AppEnv {
  static late Env env;

  static void init({Env flavor = Env.prod}) {
    env = flavor;
  }
}
