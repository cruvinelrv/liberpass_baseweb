// ignore_for_file: constant_identifier_names

enum EnumTypeContactEnum {
  PHONE(idTypeContact: 1, nameTypeContact: 'TELEFONE'),
  CELULAR(idTypeContact: 2, nameTypeContact: 'CELULAR'),
  EMAIL(idTypeContact: 3, nameTypeContact: 'EMAIL'),
  WHATSAPP(idTypeContact: 4, nameTypeContact: 'WHATSAPP'),
  FACEBOOK(idTypeContact: 5, nameTypeContact: 'FACEBOOK'),
  INSTAGRAM(idTypeContact: 6, nameTypeContact: 'INSTAGRAM'),
  LINKEDIN(idTypeContact: 7, nameTypeContact: 'LINKEDIN'),
  TWITTER(idTypeContact: 8, nameTypeContact: 'TWITTER'),
  YOUTUBE(idTypeContact: 9, nameTypeContact: 'YOUTUBE'),
  DISCORD(idTypeContact: 10, nameTypeContact: 'DISCORD'),
  SKYPE(idTypeContact: 11, nameTypeContact: 'SKYPE'),
  TELEGRAM(idTypeContact: 12, nameTypeContact: 'TELEGRAM'),
  TIKTOK(idTypeContact: 13, nameTypeContact: 'TIKTOK'),
  SNAPCHAT(idTypeContact: 14, nameTypeContact: 'SNAPCHAT'),
  PINTEREST(idTypeContact: 15, nameTypeContact: 'PINTEREST'),
  TUMBLR(idTypeContact: 16, nameTypeContact: 'TUMBLR'),
  TWITCH(idTypeContact: 17, nameTypeContact: 'TWITCH'),
  CLUBHOUSE(idTypeContact: 18, nameTypeContact: 'CLUBHOUSE'),
  REDDIT(idTypeContact: 19, nameTypeContact: 'REDDIT'),
  GITHUB(idTypeContact: 20, nameTypeContact: 'GITHUB'),
  BEHANCE(idTypeContact: 21, nameTypeContact: 'BEHANCE'),
  DRIBBBLE(idTypeContact: 22, nameTypeContact: 'DRIBBBLE'),
  FLICKR(idTypeContact: 23, nameTypeContact: 'FLICKR'),
  GMAIL(idTypeContact: 24, nameTypeContact: 'GMAIL'),
  ICLOUD(idTypeContact: 25, nameTypeContact: 'ICLOUD'),
  MICROSOFT(idTypeContact: 26, nameTypeContact: 'MICROSOFT'),
  OUTLOOK(idTypeContact: 27, nameTypeContact: 'OUTLOOK'),
  PROTONMAIL(idTypeContact: 28, nameTypeContact: 'PROTONMAIL'),
  YAHOO(idTypeContact: 29, nameTypeContact: 'YAHOO'),
  ZOOM(idTypeContact: 30, nameTypeContact: 'ZOOM'),
  OTHER(idTypeContact: 31, nameTypeContact: 'OUTRO');

  final int idTypeContact;
  final String nameTypeContact;
  const EnumTypeContactEnum({
    required this.idTypeContact,
    required this.nameTypeContact,
  });
}
