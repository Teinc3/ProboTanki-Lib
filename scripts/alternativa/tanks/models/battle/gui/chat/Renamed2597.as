package alternativa.tanks.models.battle.gui.chat
{
   import Renamed136.Renamed663;
   import Renamed17.MessageColor;
   import Renamed230.Renamed2588;
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.Label;
   import flash.text.AntiAliasType;
   import Renamed379.Renamed2647;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Renamed2597 extends Renamed2588
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private var output:Label;
      
      private var _namesWidth:int = 0;
      
      private var _width:int = 300;
      
      private var Renamed2648:Renamed2647;
      
      public function Renamed2597(param1:String, param2:Renamed663, param3:String, param4:Boolean, param5:Boolean)
      {
         var _loc6_:Label = null;
         _loc6_ = null;
         this.output = new Label();
         super();
         var _loc7_:int = 0;
         if(param5)
         {
            _loc7_ = 14;
            (_loc6_ = new Label()).color = MessageColor.YELLOW;
            _loc6_.text = localeService.getText(TanksLocale.TEXT_SPECTATOR_NAME) + ":";
            _loc6_.thickness = 50;
            _loc6_.sharpness = 0;
            _loc6_.mouseEnabled = false;
            shadowContainer.addChild(_loc6_);
            _loc6_.x = _loc7_;
            _loc7_ += _loc6_.textWidth + 1;
         }
         else
         {
            this.Renamed2648 = new Renamed2647(param1);
            this.Renamed2648.setUidColor(MessageColor.Renamed2649(param2,param5),true);
            this.Renamed2648.setAdditionalText(":");
            addChild(this.Renamed2648);
            _loc7_ += this.Renamed2648.width;
         }
         this.output.color = MessageColor.Renamed2650(param2,param4,param5);
         this.output.antiAliasType = AntiAliasType.ADVANCED;
         this.output.thickness = 150;
         this.output.sharpness = 200;
         this.output.multiline = true;
         this.output.wordWrap = true;
         this.output.mouseEnabled = false;
         shadowContainer.addChild(this.output);
         this._namesWidth = _loc7_;
         if(this._namesWidth > this._width / 2)
         {
            this.output.y = 15;
            this.output.x = 0;
            this.output.width = this._width - 5;
         }
         else
         {
            this.output.x = this._namesWidth + 3;
            this.output.y = 0;
            this.output.width = this._width - this._namesWidth - 8;
         }
         this.output.text = param3;
      }
      
      [Obfuscation(rename="false")]
      public function alignChatUserLabel() : void
      {
         this._namesWidth = this.Renamed2648.width;
         if(this._namesWidth > this._width / 2)
         {
            this.output.y = 15;
            this.output.x = 0;
            this.output.width = this._width - 5;
         }
         else
         {
            this.output.x = this._namesWidth + 3;
            this.output.y = 0;
            this.output.width = this._width - this._namesWidth - 8;
         }
      }
      
      [Obfuscation(rename="false")]
      override public function set width(param1:Number) : void
      {
         this._width = int(param1);
         if(this._namesWidth > this._width / 2 && this.output.text.length * 8 > this._width - this._namesWidth)
         {
            this.output.y = 21;
            this.output.x = 0;
            this.output.width = this._width - 5;
            this.output.height = 20;
         }
         else
         {
            this.output.x = this._namesWidth;
            this.output.y = 0;
            this.output.width = this._width - this._namesWidth - 5;
            this.output.height = 20;
         }
      }
   }
}

