var target_marker = func() {
  // draw hud markers on top of each AI/MP target
  SGPropertyNode *models = globals->get_props()->getNode("/ai/models", true);
  for (int i = 0; i < models->nChildren(); i++) {
    SGPropertyNode *chld = models->getChild(i);
    string name;
    name = chld->getName();
    if (name == "aircraft" || name == "multiplayer" || type == "tanker" || type =="carrier") {
      string callsign = chld->getStringValue("callsign");
      if (callsign != "") {
        float h_deg = chld->getFloatValue("radar/h-offset");
        float v_deg = chld->getFloatValue("radar/v-offset");
        float pos_x = (h_deg * cos(roll_value) - v_deg * sin(roll_value)) * _compression;
        float pos_y = (v_deg * cos(roll_value) + h_deg * sin(roll_value)) * _compression;
        draw_circle(pos_x, pos_y, 8);
      }
    }
  }
}
