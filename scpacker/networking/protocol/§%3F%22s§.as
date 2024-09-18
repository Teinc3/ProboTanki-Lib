package scpacker.networking.protocol
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import §null catch class§.§5"p§;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import scpacker.networking.Network;
   import scpacker.networking.protocol.codec.complex.ByteArrayCodec;
   import scpacker.networking.protocol.codec.complex.VectorCodecInt;
   import scpacker.networking.protocol.codec.complex.VectorCodecString;
   import scpacker.networking.protocol.codec.custom.§,#k§;
   import scpacker.networking.protocol.codec.custom.§3!9§;
   import scpacker.networking.protocol.codec.custom.CaptchaLocationCodec;
   import scpacker.networking.protocol.codec.custom.CodecAchievement;
   import scpacker.networking.protocol.codec.custom.CodecAchievementCC;
   import scpacker.networking.protocol.codec.custom.CodecAssaultBase;
   import scpacker.networking.protocol.codec.custom.CodecAssaultCC;
   import scpacker.networking.protocol.codec.custom.CodecAssaultSoundFX;
   import scpacker.networking.protocol.codec.custom.CodecBattleCreateParameters;
   import scpacker.networking.protocol.codec.custom.CodecBattleInfoData;
   import scpacker.networking.protocol.codec.custom.CodecBattleInfoUser;
   import scpacker.networking.protocol.codec.custom.CodecBattleInviteCC;
   import scpacker.networking.protocol.codec.custom.CodecBattleInviteMessage;
   import scpacker.networking.protocol.codec.custom.CodecBattleLimits;
   import scpacker.networking.protocol.codec.custom.CodecBattleMine;
   import scpacker.networking.protocol.codec.custom.CodecBattleMineCC;
   import scpacker.networking.protocol.codec.custom.CodecBattleMode;
   import scpacker.networking.protocol.codec.custom.CodecBattleNotifierData;
   import scpacker.networking.protocol.codec.custom.CodecBattleSuspicionLevel;
   import scpacker.networking.protocol.codec.custom.CodecBattleTeam;
   import scpacker.networking.protocol.codec.custom.CodecBonusInfoCC;
   import scpacker.networking.protocol.codec.custom.CodecCaptureTheFlagCC;
   import scpacker.networking.protocol.codec.custom.CodecCaptureTheFlagSoundFX;
   import scpacker.networking.protocol.codec.custom.CodecChatCC;
   import scpacker.networking.protocol.codec.custom.CodecChatMessage;
   import scpacker.networking.protocol.codec.custom.CodecChatModeratorLevel;
   import scpacker.networking.protocol.codec.custom.CodecClientAssaultFlag;
   import scpacker.networking.protocol.codec.custom.CodecClientFlag;
   import scpacker.networking.protocol.codec.custom.CodecClientPointData;
   import scpacker.networking.protocol.codec.custom.CodecControlPointState;
   import scpacker.networking.protocol.codec.custom.CodecControlPointsCC;
   import scpacker.networking.protocol.codec.custom.CodecCountryInfo;
   import scpacker.networking.protocol.codec.custom.CodecDailyQuestInfo;
   import scpacker.networking.protocol.codec.custom.CodecDailyQuestPrizeInfo;
   import scpacker.networking.protocol.codec.custom.CodecDamageIndicatorType;
   import scpacker.networking.protocol.codec.custom.CodecDominationResources;
   import scpacker.networking.protocol.codec.custom.CodecDominationSounds;
   import scpacker.networking.protocol.codec.custom.CodecEquipmentConstraintsMode;
   import scpacker.networking.protocol.codec.custom.CodecGarageItemInfo;
   import scpacker.networking.protocol.codec.custom.CodecImagePair;
   import scpacker.networking.protocol.codec.custom.CodecIsisState;
   import scpacker.networking.protocol.codec.custom.CodecItemCategoryEnum;
   import scpacker.networking.protocol.codec.custom.CodecItemViewCategoryEnum;
   import scpacker.networking.protocol.codec.custom.CodecLayoutState;
   import scpacker.networking.protocol.codec.custom.CodecLocaleStruct;
   import scpacker.networking.protocol.codec.custom.CodecMapTheme;
   import scpacker.networking.protocol.codec.custom.CodecMoveCommand;
   import scpacker.networking.protocol.codec.custom.CodecNewsItemCC;
   import scpacker.networking.protocol.codec.custom.CodecNewsShowingCC;
   import scpacker.networking.protocol.codec.custom.CodecOnlineNotifierData;
   import scpacker.networking.protocol.codec.custom.CodecPremiumAccountAlertCC;
   import scpacker.networking.protocol.codec.custom.CodecPremiumNotifierCC;
   import scpacker.networking.protocol.codec.custom.CodecPremiumNotifierData;
   import scpacker.networking.protocol.codec.custom.CodecRange;
   import scpacker.networking.protocol.codec.custom.CodecRankNotifierData;
   import scpacker.networking.protocol.codec.custom.CodecReferrerIncomeData;
   import scpacker.networking.protocol.codec.custom.CodecReferrerPanelCC;
   import scpacker.networking.protocol.codec.custom.CodecRotateTurretCommand;
   import scpacker.networking.protocol.codec.custom.CodecSocialNetworkEntranceParams;
   import scpacker.networking.protocol.codec.custom.CodecSocialNetworkPanelCC;
   import scpacker.networking.protocol.codec.custom.CodecSocialNetworkPanelParams;
   import scpacker.networking.protocol.codec.custom.CodecStatisticsDMCC;
   import scpacker.networking.protocol.codec.custom.CodecStatisticsModelCC;
   import scpacker.networking.protocol.codec.custom.CodecStatisticsTeamCC;
   import scpacker.networking.protocol.codec.custom.CodecStringPair;
   import scpacker.networking.protocol.codec.custom.CodecTargetHit;
   import scpacker.networking.protocol.codec.custom.CodecTargetPosition;
   import scpacker.networking.protocol.codec.custom.CodecTargetTankDamage;
   import scpacker.networking.protocol.codec.custom.CodecTipItemCC;
   import scpacker.networking.protocol.codec.custom.CodecUserContainerCC;
   import scpacker.networking.protocol.codec.custom.CodecUserCountryCC;
   import scpacker.networking.protocol.codec.custom.CodecUserInfo;
   import scpacker.networking.protocol.codec.custom.CodecUserPropertyCC;
   import scpacker.networking.protocol.codec.custom.CodecUserReward;
   import scpacker.networking.protocol.codec.custom.CodecUserStat;
   import scpacker.networking.protocol.codec.custom.CodecUserStatus;
   import scpacker.networking.protocol.codec.custom.CodecValidationStatus;
   import scpacker.networking.protocol.codec.custom.CodecVector3d;
   import scpacker.networking.protocol.codec.custom.CodecWeeklyQuestDescription;
   import scpacker.networking.protocol.codec.custom.CodecWeeklyQuestRewardItem;
   import scpacker.networking.protocol.codec.custom.ResourceGetterCodec;
   import scpacker.networking.protocol.codec.custom.VectorCodecAchievement;
   import scpacker.networking.protocol.codec.custom.VectorCodecAssaultBase;
   import scpacker.networking.protocol.codec.custom.VectorCodecBattleMine;
   import scpacker.networking.protocol.codec.custom.VectorCodecBonusSpawnData;
   import scpacker.networking.protocol.codec.custom.VectorCodecByte;
   import scpacker.networking.protocol.codec.custom.VectorCodecCaptchaLocation;
   import scpacker.networking.protocol.codec.custom.VectorCodecChatMessage;
   import scpacker.networking.protocol.codec.custom.VectorCodecClientAssaultFlag;
   import scpacker.networking.protocol.codec.custom.VectorCodecClientPointData;
   import scpacker.networking.protocol.codec.custom.VectorCodecCountryInfo;
   import scpacker.networking.protocol.codec.custom.VectorCodecDailyQuestInfo;
   import scpacker.networking.protocol.codec.custom.VectorCodecDailyQuestPrizeInfo;
   import scpacker.networking.protocol.codec.custom.VectorCodecGarageItemInfo;
   import scpacker.networking.protocol.codec.custom.VectorCodecImagePair;
   import scpacker.networking.protocol.codec.custom.VectorCodecNewsItemCC;
   import scpacker.networking.protocol.codec.custom.VectorCodecReferrerIncomeData;
   import scpacker.networking.protocol.codec.custom.VectorCodecShort;
   import scpacker.networking.protocol.codec.custom.VectorCodecSocialNetworkEntranceParams;
   import scpacker.networking.protocol.codec.custom.VectorCodecSocialNetworkPanelParams;
   import scpacker.networking.protocol.codec.custom.VectorCodecStringPair;
   import scpacker.networking.protocol.codec.custom.VectorCodecTargetHit;
   import scpacker.networking.protocol.codec.custom.VectorCodecTargetPosition;
   import scpacker.networking.protocol.codec.custom.VectorCodecTargetTankDamage;
   import scpacker.networking.protocol.codec.custom.VectorCodecUserInfo;
   import scpacker.networking.protocol.codec.custom.VectorCodecUserReward;
   import scpacker.networking.protocol.codec.custom.VectorCodecUserStat;
   import scpacker.networking.protocol.codec.custom.VectorCodecVector3d;
   import scpacker.networking.protocol.codec.custom.VectorCodecWeeklyQuestRewardItem;
   import scpacker.networking.protocol.codec.custom.§[3§;
   import scpacker.networking.protocol.codec.custom.§else const include§;
   import scpacker.networking.protocol.codec.primitive.BooleanCodec;
   import scpacker.networking.protocol.codec.primitive.ByteCodec;
   import scpacker.networking.protocol.codec.primitive.DoubleCodec;
   import scpacker.networking.protocol.codec.primitive.FloatCodec;
   import scpacker.networking.protocol.codec.primitive.IntCodec;
   import scpacker.networking.protocol.codec.primitive.LongCodec;
   import scpacker.networking.protocol.codec.primitive.ShortCodec;
   import scpacker.networking.protocol.codec.primitive.StringCodec;
   import §switch native§.PrimitiveProtectionContext;
   import §switch native§.§override set native§;
   import §switch native§.§throw set true§;
   
   public class §?"s§
   {
      private var §4!r§:Dictionary;
      
      private var context:§throw set true§;
      
      private var §3">§:Boolean = false;
      
      public function §?"s§()
      {
         this.§4!r§ = new Dictionary();
         this.context = new PrimitiveProtectionContext();
         super();
         this.registerCodecForType(new BooleanCodec());
         this.registerCodecForType(new ByteCodec());
         this.registerCodecForType(new FloatCodec());
         this.registerCodecForType(new IntCodec());
         this.registerCodecForType(new DoubleCodec());
         this.registerCodecForType(new ShortCodec());
         this.registerCodecForType(new StringCodec());
         this.registerCodecForType(new LongCodec());
         this.registerCodecForType(new VectorCodecInt(this.getCodec("scpacker.networking.protocol.codec.primitive.ByteCodec")));
         this.registerCodecForType(new VectorCodecString(this.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec")));
         this.registerCodecForType(new VectorCodecByte(this));
         this.registerCodecForType(new ByteArrayCodec());
         this.registerCodecForType(new CodecImagePair(this));
         this.registerCodecForType(new CodecStringPair(this));
         this.registerCodecForType(new VectorCodecImagePair(this));
         this.registerCodecForType(new VectorCodecStringPair(this));
         this.registerCodecForType(new CodecLocaleStruct(this));
      }
      
      public function init() : void
      {
         this.registerCodecForType(new ResourceGetterCodec(this,ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry))));
         this.registerCodecForType(new CaptchaLocationCodec());
         this.registerCodecForType(new CodecUserPropertyCC(this));
         this.registerCodecForType(new CodecPremiumAccountAlertCC(this));
         this.registerCodecForType(new CodecPremiumNotifierCC(this));
         this.registerCodecForType(new CodecLayoutState());
         this.registerCodecForType(new CodecUserContainerCC(this));
         this.registerCodecForType(new CodecBattleMode());
         this.registerCodecForType(new CodecBattleInviteMessage(this));
         this.registerCodecForType(new CodecDailyQuestPrizeInfo(this));
         this.registerCodecForType(new VectorCodecDailyQuestPrizeInfo(this));
         this.registerCodecForType(new CodecDailyQuestInfo(this));
         this.registerCodecForType(new CodecWeeklyQuestDescription(this));
         this.registerCodecForType(new CodecWeeklyQuestRewardItem(this));
         this.registerCodecForType(new CodecRange(this));
         this.registerCodecForType(new CodecBattleInfoData(this));
         this.registerCodecForType(new CodecPremiumNotifierData(this));
         this.registerCodecForType(new CodecOnlineNotifierData(this));
         this.registerCodecForType(new CodecRankNotifierData(this));
         this.registerCodecForType(new §[3§(this));
         this.registerCodecForType(new CodecBattleNotifierData(this));
         this.registerCodecForType(new VectorCodecDailyQuestInfo(this));
         this.registerCodecForType(new VectorCodecWeeklyQuestRewardItem(this));
         this.registerCodecForType(new CodecBonusInfoCC(this));
         this.registerCodecForType(new CodecSocialNetworkPanelParams(this));
         this.registerCodecForType(new VectorCodecSocialNetworkPanelParams(this));
         this.registerCodecForType(new CodecSocialNetworkPanelCC(this));
         this.registerCodecForType(new CodecItemCategoryEnum());
         this.registerCodecForType(new CodecItemViewCategoryEnum());
         this.registerCodecForType(new CodecGarageItemInfo(this));
         this.registerCodecForType(new VectorCodecGarageItemInfo(this));
         this.registerCodecForType(new CodecChatModeratorLevel());
         this.registerCodecForType(new CodecUserStatus(this));
         this.registerCodecForType(new CodecChatMessage(this));
         this.registerCodecForType(new VectorCodecChatMessage(this));
         this.registerCodecForType(new CodecChatCC(this));
         this.registerCodecForType(new CodecBattleLimits(this));
         this.registerCodecForType(new CodecMapTheme());
         this.registerCodecForType(new CodecEquipmentConstraintsMode());
         this.registerCodecForType(new CodecBattleCreateParameters(this));
         this.registerCodecForType(new CodecBattleTeam());
         this.registerCodecForType(new CodecBattleInfoUser(this));
         this.registerCodecForType(new CodecValidationStatus());
         this.registerCodecForType(new CodecStatisticsModelCC(this));
         this.registerCodecForType(new CodecVector3d(this));
         this.registerCodecForType(new CodecMoveCommand(this));
         this.registerCodecForType(new CodecUserInfo(this));
         this.registerCodecForType(new VectorCodecUserInfo(this));
         this.registerCodecForType(new CodecStatisticsTeamCC(this));
         this.registerCodecForType(new CodecRotateTurretCommand(this));
         this.registerCodecForType(new CodecClientFlag(this));
         this.registerCodecForType(new CodecCaptureTheFlagSoundFX(this));
         this.registerCodecForType(new CodecCaptureTheFlagCC(this));
         this.registerCodecForType(new CodecDamageIndicatorType());
         this.registerCodecForType(new §else const include§(this));
         this.registerCodecForType(new CodecTargetTankDamage(this));
         this.registerCodecForType(new VectorCodecTargetTankDamage(this));
         this.registerCodecForType(new CodecUserStat(this));
         this.registerCodecForType(new VectorCodecUserStat(this));
         this.registerCodecForType(new §3!9§(this));
         this.registerCodecForType(new VectorCodecBonusSpawnData(this));
         this.registerCodecForType(new CodecControlPointState());
         this.registerCodecForType(new CodecClientPointData(this));
         this.registerCodecForType(new VectorCodecClientPointData(this));
         this.registerCodecForType(new CodecDominationResources(this));
         this.registerCodecForType(new CodecDominationSounds(this));
         this.registerCodecForType(new CodecControlPointsCC(this));
         this.registerCodecForType(new VectorCodecVector3d(this));
         this.registerCodecForType(new §,#k§(this));
         this.registerCodecForType(new VectorCodecShort(this));
         this.registerCodecForType(new CodecBattleMine(this));
         this.registerCodecForType(new VectorCodecBattleMine(this));
         this.registerCodecForType(new CodecBattleMineCC(this));
         this.registerCodecForType(new CodecStatisticsDMCC(this));
         this.registerCodecForType(new CodecIsisState());
         this.registerCodecForType(new CodecTargetHit(this));
         this.registerCodecForType(new VectorCodecTargetHit(this));
         this.registerCodecForType(new CodecUserReward(this));
         this.registerCodecForType(new VectorCodecUserReward(this));
         this.registerCodecForType(new VectorCodecCaptchaLocation(this));
         this.registerCodecForType(new CodecAchievement());
         this.registerCodecForType(new VectorCodecAchievement(this));
         this.registerCodecForType(new CodecAchievementCC(this));
         this.registerCodecForType(new CodecNewsItemCC(this));
         this.registerCodecForType(new VectorCodecNewsItemCC(this));
         this.registerCodecForType(new CodecNewsShowingCC(this));
         this.registerCodecForType(new CodecTargetPosition(this));
         this.registerCodecForType(new VectorCodecTargetPosition(this));
         this.registerCodecForType(new CodecAssaultBase(this));
         this.registerCodecForType(new VectorCodecAssaultBase(this));
         this.registerCodecForType(new CodecAssaultSoundFX(this));
         this.registerCodecForType(new CodecClientAssaultFlag(this));
         this.registerCodecForType(new VectorCodecClientAssaultFlag(this));
         this.registerCodecForType(new CodecAssaultCC(this));
         this.registerCodecForType(new CodecBattleSuspicionLevel());
         this.registerCodecForType(new CodecBattleInviteCC(this));
         this.registerCodecForType(new CodecTipItemCC(this));
         this.registerCodecForType(new CodecSocialNetworkEntranceParams(this));
         this.registerCodecForType(new VectorCodecSocialNetworkEntranceParams(this));
         this.registerCodecForType(new CodecCountryInfo(this));
         this.registerCodecForType(new VectorCodecCountryInfo(this));
         this.registerCodecForType(new CodecUserCountryCC(this));
         this.registerCodecForType(new CodecReferrerIncomeData(this));
         this.registerCodecForType(new VectorCodecReferrerIncomeData(this));
         this.registerCodecForType(new CodecReferrerPanelCC(this));
      }
      
      public function hashReceived(param1:Vector.<int>) : void
      {
         this.context = new §override set native§(param1);
         Network(OSGi.getInstance().getService(Network)).send(new §5"p§(ILocaleService(OSGi.getInstance().getService(ILocaleService)).language));
         this.§3">§ = true;
      }
      
      public function §2"C§() : §throw set true§
      {
         return this.context;
      }
      
      public function registerCodecForType(param1:ICodec) : void
      {
         this.§4!r§[getQualifiedClassName(param1).replace("::",".")] = param1;
      }
      
      public function getCodec(param1:String) : ICodec
      {
         return this.§4!r§[param1];
      }
      
      public function get §include set implements§() : Boolean
      {
         return this.§3">§;
      }
   }
}

