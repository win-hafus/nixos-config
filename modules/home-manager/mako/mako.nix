{
  service.mako = {
    enable = true;
    settings = {
      layer="overlay";
      background-color="#24273a80";
      text-color="#cad3f5";
      border-color="#a6e3a1";
      progress-color="over #363a4f";
      default-timeout=5000;
      border-radius=8;

      "urgency=low" = {
        border-color="#eed49f";
      };
      "urgency=high" = {
        border-color="#f5a97f";
      };
    };
  }
}
