package alternativa.tanks.services.battlegui
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.utils.removeDisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.EventDispatcher;
   
   public class §continue for else§ extends EventDispatcher implements BattleGUIService
   {
      [Inject]
      public static var display:IDisplay;
      
      private var § "8§:Sprite;
      
      private var §%#,§:Sprite;
      
      private var §#!0§:Sprite;
      
      private var §&6§:int;
      
      private var §include var§:int;
      
      public function §continue for else§()
      {
         this.§ "8§ = new Sprite();
         this.§%#,§ = new Sprite();
         this.§#!0§ = new Sprite();
         super();
      }
      
      public function §native const import§() : DisplayObjectContainer
      {
         return this.§ "8§;
      }
      
      public function §break catch true§() : DisplayObjectContainer
      {
         return this.§%#,§;
      }
      
      public function §get final§() : DisplayObjectContainer
      {
         return this.§#!0§;
      }
      
      public function hide() : void
      {
         removeDisplayObject(this.§ "8§);
         removeDisplayObject(this.§%#,§);
         removeDisplayObject(this.§#!0§);
      }
      
      public function show() : void
      {
         display.contentLayer.addChild(this.§ "8§);
         display.contentUILayer.addChild(this.§%#,§);
         display.contentUILayer.addChild(this.§#!0§);
      }
      
      public function §import var try§(param1:int) : void
      {
         this.§&6§ = param1;
         dispatchEvent(new BattleGUIServiceEvent(BattleGUIServiceEvent.ON_CHANGE_POSITION_DEFAULT_LAYOUT));
      }
      
      public function §in catch static§() : int
      {
         return this.§&6§;
      }
      
      public function §get set use§(param1:int) : void
      {
         this.§include var§ = param1;
         dispatchEvent(new §]!l§());
      }
      
      public function §9"n§() : int
      {
         return this.§include var§;
      }
      
      public function §break var implements§() : void
      {
         this.§include var§ = 0;
      }
   }
}

