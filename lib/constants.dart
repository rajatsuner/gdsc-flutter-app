import 'package:flutter/material.dart';

const serverUrl = "localhost:8080";

class Constants {
  static const dsc = "Developer Student Club";
  static const gdscCampusName =
      "Institute of Engineering and Science, IPS Academy";
  static const certificateVerificationMessage =
      "Verify the authenticity of the Certificates Issued by Google Developer Student Club IPS Academy. Enter the verification code given on the certificates to check it's authenticity. Click Below : ";

  static const aboutUsMessage =
      "Google Developer Student Clubs (GDSC) are community groups for college and university students interested in Google developer technologies. Students from all undergraduate or graduate programs with an interest in growing as a developer are welcome. By joining a GDSC, students grow their knowledge in a peer-to-peer learning environment and build solutions for local businesses and their community.";
}

class Themer {
  static const backgroundColor = Color.fromARGB(255, 240, 243, 244);
  static const selectedNavItemColor = Colors.indigo;
  static const unselectedNavItemColor = Colors.blueGrey;
}

class Assets {
  //GDSC logo
  static const gdscLogo = "assets/general_images/gdsc_logo.png";
  static const gdscLogoAnimated = "assets/general_images/gdsc_logo.gif";
  static const googleBulb = "assets/general_images/google_bulb.gif";
  static const eventFinding = "assets/general_images/event_finding.png";

  //Social media icons
  static const instagram = "assets/social_icons/instagram.png";
  static const linkedin = "assets/social_icons/linkedin.png";
  static const github = "assets/social_icons/github.png";
  static const twitter = "assets/social_icons/twitter.png";

  static const backButton = "assets/general_images/back_button.png";
  static const teamPageArt = "assets/general_images/team.gif";
}
