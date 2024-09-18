package alternativa.tanks.view.battleinfo
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.battleservice.Renamed1587;
   
   public class BattleInfoBaseParams
   {
      public var battleName:String;
      
      public var battleUrl:String;
      
      public var battleMode:Renamed1587;
      
      public var clanLink:String;
      
      public var clanName:String;
      
      public var minRank:int;
      
      public var maxRank:int;
      
      public var scoreLimit:int;
      
      public var timeLimitInSec:int;
      
      public var timeLeftInSec:int;
      
      public var spectatorEnabled:Boolean;
      
      public var withoutBonuses:Boolean;
      
      public var withoutCrystals:Boolean;
      
      public var upgradesDisabled:Boolean;
      
      public var proBattle:Boolean;
      
      public var reArmor:Boolean;
      
      public var noSupplies:Boolean;
      
      public var proBattleEnterPrice:int;
      
      public var noSuppliesTimeLeftInSec:int;
      
      public var maxPeopleCount:int;
      
      public var userPaidNoSuppliesBattle:Boolean;
      
      public var roundStarted:Boolean;
      
      public var previewResource:ImageResource;
      
      public var battleItemId:String;
      
      public var Renamed3642:Boolean;
      
      public var Renamed1625:String;
      
      public function BattleInfoBaseParams()
      {
         super();
      }
   }
}

