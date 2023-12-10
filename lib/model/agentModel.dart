class AgentModel {
  int? status;
  List<Data>? data;

  AgentModel({this.status, this.data});

  AgentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? uuid;
  String? displayName;
  String? description;
  String? developerName;
  List<String>? characterTags;
  String? displayIcon;
  String? displayIconSmall;
  String? bustPortrait;
  String? fullPortrait;
  String? fullPortraitV2;
  String? killfeedPortrait;
  String? background;
  List<String>? backgroundGradientColors;
  String? assetPath;
  bool? isFullPortraitRightFacing;
  bool? isPlayableCharacter;
  bool? isAvailableForTest;
  bool? isBaseContent;
  Role? role;
  RecruitmentData? recruitmentData;
  List<Abilities>? abilities;
  Null? voiceLine;

  Data(
      {this.uuid,
      this.displayName,
      this.description,
      this.developerName,
      this.characterTags,
      this.displayIcon,
      this.displayIconSmall,
      this.bustPortrait,
      this.fullPortrait,
      this.fullPortraitV2,
      this.killfeedPortrait,
      this.background,
      this.backgroundGradientColors,
      this.assetPath,
      this.isFullPortraitRightFacing,
      this.isPlayableCharacter,
      this.isAvailableForTest,
      this.isBaseContent,
      this.role,
      this.recruitmentData,
      this.abilities,
      this.voiceLine});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    description = json['description'];
    developerName = json['developerName'];
    characterTags = json['characterTags'].cast<String>();
    displayIcon = json['displayIcon'];
    displayIconSmall = json['displayIconSmall'];
    bustPortrait = json['bustPortrait'];
    fullPortrait = json['fullPortrait'];
    fullPortraitV2 = json['fullPortraitV2'];
    killfeedPortrait = json['killfeedPortrait'];
    background = json['background'];
    backgroundGradientColors = json['backgroundGradientColors'].cast<String>();
    assetPath = json['assetPath'];
    isFullPortraitRightFacing = json['isFullPortraitRightFacing'];
    isPlayableCharacter = json['isPlayableCharacter'];
    isAvailableForTest = json['isAvailableForTest'];
    isBaseContent = json['isBaseContent'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    recruitmentData = json['recruitmentData'] != null
        ? RecruitmentData.fromJson(json['recruitmentData'])
        : null;
    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities!.add(Abilities.fromJson(v));
      });
    }
    voiceLine = json['voiceLine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['uuid'] = uuid;
    data['displayName'] = displayName;
    data['description'] = description;
    data['developerName'] = developerName;
    data['characterTags'] = characterTags;
    data['displayIcon'] = displayIcon;
    data['displayIconSmall'] = displayIconSmall;
    data['bustPortrait'] = bustPortrait;
    data['fullPortrait'] = fullPortrait;
    data['fullPortraitV2'] = fullPortraitV2;
    data['killfeedPortrait'] = killfeedPortrait;
    data['background'] = background;
    data['backgroundGradientColors'] = backgroundGradientColors;
    data['assetPath'] = assetPath;
    data['isFullPortraitRightFacing'] = isFullPortraitRightFacing;
    data['isPlayableCharacter'] = isPlayableCharacter;
    data['isAvailableForTest'] = isAvailableForTest;
    data['isBaseContent'] = isBaseContent;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    if (recruitmentData != null) {
      data['recruitmentData'] = recruitmentData!.toJson();
    }
    if (abilities != null) {
      data['abilities'] = abilities!.map((v) => v.toJson()).toList();
    }
    data['voiceLine'] = voiceLine;
    return data;
  }
}

class Role {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  String? assetPath;

  Role(
      {this.uuid,
      this.displayName,
      this.description,
      this.displayIcon,
      this.assetPath});

  Role.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    description = json['description'];
    displayIcon = json['displayIcon'];
    assetPath = json['assetPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['uuid'] = uuid;
    data['displayName'] = displayName;
    data['description'] = description;
    data['displayIcon'] = displayIcon;
    data['assetPath'] = assetPath;
    return data;
  }
}

class RecruitmentData {
  String? counterId;
  String? milestoneId;
  int? milestoneThreshold;
  bool? useLevelVpCostOverride;
  int? levelVpCostOverride;
  String? startDate;
  String? endDate;

  RecruitmentData(
      {this.counterId,
      this.milestoneId,
      this.milestoneThreshold,
      this.useLevelVpCostOverride,
      this.levelVpCostOverride,
      this.startDate,
      this.endDate});

  RecruitmentData.fromJson(Map<String, dynamic> json) {
    counterId = json['counterId'];
    milestoneId = json['milestoneId'];
    milestoneThreshold = json['milestoneThreshold'];
    useLevelVpCostOverride = json['useLevelVpCostOverride'];
    levelVpCostOverride = json['levelVpCostOverride'];
    startDate = json['startDate'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['counterId'] = counterId;
    data['milestoneId'] = milestoneId;
    data['milestoneThreshold'] = milestoneThreshold;
    data['useLevelVpCostOverride'] = useLevelVpCostOverride;
    data['levelVpCostOverride'] = levelVpCostOverride;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    return data;
  }
}

class Abilities {
  String? slot;
  String? displayName;
  String? description;
  String? displayIcon;

  Abilities({this.slot, this.displayName, this.description, this.displayIcon});

  Abilities.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    displayName = json['displayName'];
    description = json['description'];
    displayIcon = json['displayIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['slot'] = slot;
    data['displayName'] = displayName;
    data['description'] = description;
    data['displayIcon'] = displayIcon;
    return data;
  }
}
