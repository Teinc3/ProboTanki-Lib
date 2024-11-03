package alternativa.tanks.service.battleinfo
{
   import Renamed136.Renamed663;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.controllers.battleinfo.BattleInfoDMController;
   import alternativa.tanks.controllers.battleinfo.BattleInfoTeamController;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.battleinfo.BattleInfoViewEvent;
   import alternativa.tanks.view.battleinfo.LocaleBattleInfo;
   import alternativa.tanks.view.battleinfo.dm.BattleInfoDMView;
   import alternativa.tanks.view.battleinfo.dm.BattleInfoDmParams;
   import alternativa.tanks.view.battleinfo.team.BattleInfoTeamParams;
   import alternativa.tanks.view.battleinfo.team.BattleInfoTeamView;
   import flash.events.EventDispatcher;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class Renamed543 extends EventDispatcher implements IBattleInfoFormService
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      private static const GA_CATEGORY:String = "lobby";
      
      private var Renamed3631:BattleInfoDMController;
      
      private var Renamed3632:BattleInfoTeamController;
      
      private var Renamed3633:Boolean;
      
      private var Renamed3634:Boolean;
      
      public function Renamed543()
      {
         super();
      }
      
      public function Renamed1622() : void
      {
         if(this.Renamed3633)
         {
            this.Renamed3631.addFormToStage();
         }
         if(this.Renamed3634)
         {
            this.Renamed3632.addFormToStage();
         }
      }
      
      public function removeFormFromStage() : void
      {
         if(this.Renamed3633)
         {
            this.Renamed3631.removeFormFromStage();
         }
         if(this.Renamed3634)
         {
            this.Renamed3632.removeFormFromStage();
         }
      }
      
      public function Renamed3626(param1:BattleInfoDmParams) : void
      {
         if(this.Renamed3631 == null)
         {
            this.Renamed3631 = new BattleInfoDMController(new BattleInfoDMView(display,new LocaleBattleInfo()));
            this.Renamed3631.addEventListener(BattleInfoViewEvent.ENTER_DM,this.Renamed3635);
            this.Renamed3631.addEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
         }
         this.Renamed2121();
         this.Renamed3633 = true;
         this.Renamed3631.showForm(param1);
      }
      
      private function Renamed3635(param1:BattleInfoViewEvent) : void
      {
         dispatchEvent(param1.clone());
         trackerService.trackEvent(GA_CATEGORY,"enterBattle","DM");
      }
      
      public function Renamed3627(param1:BattleInfoTeamParams) : void
      {
         if(this.Renamed3632 == null)
         {
            this.Renamed3632 = new BattleInfoTeamController(new BattleInfoTeamView(display,new LocaleBattleInfo()));
            this.Renamed3632.addEventListener(BattleInfoViewEvent.ENTER_TEAM,this.onEnterTeam);
            this.Renamed3632.addEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
         }
         this.Renamed2121();
         this.Renamed3634 = true;
         this.Renamed3632.showForm(param1);
      }
      
      public function Renamed3630() : void
      {
         if(this.Renamed3632 != null)
         {
            this.Renamed3632.updateAvailableEnterInBattle();
         }
         if(this.Renamed3631 != null)
         {
            this.Renamed3631.updateAvailableEnterInBattle();
         }
      }
      
      private function onEnterTeam(param1:BattleInfoViewEvent) : void
      {
         dispatchEvent(param1.clone());
         trackerService.trackEvent(GA_CATEGORY,"enterBattle","Team");
      }
      
      private function onEnterSpectator(param1:BattleInfoViewEvent) : void
      {
         dispatchEvent(param1.clone());
         trackerService.trackEvent(GA_CATEGORY,"enterBattle","Spectator");
      }
      
      public function Renamed2121() : void
      {
         this.Renamed3636();
         this.Renamed3637();
      }
      
      private function Renamed3636() : void
      {
         if(this.Renamed3633)
         {
            this.Renamed3633 = false;
            this.Renamed3631.hideForm();
         }
      }
      
      private function Renamed3637() : void
      {
         if(this.Renamed3634)
         {
            this.Renamed3634 = false;
            this.Renamed3632.hideForm();
         }
      }
      
      public function destroy() : void
      {
         if(this.Renamed3631 != null)
         {
            this.Renamed3631.removeEventListener(BattleInfoViewEvent.ENTER_DM,this.Renamed3635);
            this.Renamed3631.removeEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
            this.Renamed3631.destroy();
            this.Renamed3631 = null;
            this.Renamed3633 = false;
         }
         if(this.Renamed3632 != null)
         {
            this.Renamed3632.removeEventListener(BattleInfoViewEvent.ENTER_TEAM,this.onEnterTeam);
            this.Renamed3632.removeEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,this.onEnterSpectator);
            this.Renamed3632.destroy();
            this.Renamed3632 = null;
            this.Renamed3634 = false;
         }
      }
      
      public function updateName(param1:String) : void
      {
         if(this.Renamed3633)
         {
            this.Renamed3631.updateName(param1);
         }
         if(this.Renamed3634)
         {
            this.Renamed3632.updateName(param1);
         }
      }
      
      public function updateTeamScore(param1:Renamed663, param2:int) : void
      {
         if(this.Renamed3634)
         {
            this.Renamed3632.updateTeamScore(param1,param2);
         }
      }
      
      public function addUserTeam(param1:BattleInfoUser, param2:Renamed663) : void
      {
         if(this.Renamed3634)
         {
            this.Renamed3632.addUserTeam(param1,param2);
         }
      }
      
      public function Renamed3628(param1:BattleInfoUser) : void
      {
         if(this.Renamed3633)
         {
            this.Renamed3631.addUser(param1);
         }
      }
      
      public function removeUser(param1:String) : void
      {
         if(this.Renamed3633)
         {
            this.Renamed3631.removeUser(param1);
         }
         if(this.Renamed3634)
         {
            this.Renamed3632.removeUser(param1);
         }
      }
      
      public function updateUserScore(param1:String, param2:int) : void
      {
         if(this.Renamed3633)
         {
            this.Renamed3631.updateUserScore(param1,param2);
         }
         if(this.Renamed3634)
         {
            this.Renamed3632.updateUserScore(param1,param2);
         }
      }
      
      public function updateUserSuspiciousState(param1:String, param2:Boolean) : void
      {
         if(this.Renamed3633)
         {
            this.Renamed3631.updateUserSuspiciousState(param1,param2);
         }
         if(this.Renamed3634)
         {
            this.Renamed3632.updateUserSuspiciousState(param1,param2);
         }
      }
      
      public function swapTeams() : void
      {
         if(this.Renamed3634)
         {
            this.Renamed3632.swapTeams();
         }
      }
      
      public function roundStart() : void
      {
         if(this.Renamed3633)
         {
            this.Renamed3631.roundStart();
         }
         if(this.Renamed3634)
         {
            this.Renamed3632.roundStart();
         }
      }
      
      public function roundFinish() : void
      {
         if(this.Renamed3633)
         {
            this.Renamed3631.roundFinish();
         }
         if(this.Renamed3634)
         {
            this.Renamed3632.roundFinish();
         }
      }
      
      public function battleStop() : void
      {
         if(this.Renamed3633)
         {
            this.Renamed3631.battleStop();
         }
         if(this.Renamed3634)
         {
            this.Renamed3632.battleStop();
         }
      }
      
      public function Renamed3629() : void
      {
         if(this.Renamed3633)
         {
            this.Renamed3631.durationBattleNoSuppliesIsOverAboniment();
         }
         if(this.Renamed3634)
         {
            this.Renamed3632.durationBattleNoSuppliesIsOverAboniment();
         }
      }
      
      public function getBattleItemId() : String
      {
         if(this.Renamed3633)
         {
            return this.Renamed3631.getBattleItemId();
         }
         if(this.Renamed3634)
         {
            return this.Renamed3632.getBattleItemId();
         }
         return null;
      }
   }
}

