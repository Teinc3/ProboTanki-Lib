package Renamed451
{
   import Renamed317.Renamed7679;
   import controls.Label;
   import controls.Money;
   import controls.resultassets.ResultWindowBlueNormal;
   import controls.resultassets.ResultWindowBlueSelected;
   import controls.resultassets.ResultWindowGreenNormal;
   import controls.resultassets.ResultWindowGreenSelected;
   import controls.resultassets.ResultWindowRedNormal;
   import controls.resultassets.ResultWindowRedSelected;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import forms.ColorConstants;
   import forms.userlabel.UserLabel;
   import Renamed379.Renamed8332;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   
   public class Renamed4717 extends CellRenderer
   {
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      public static var Renamed9009:Boolean;
      
      private static const COLOR_NORMAL:uint = 16777215;
      
      private static const Renamed9010:uint = 11184810;
      
      private static const Renamed9011:uint = 15976448;
      
      private static const Renamed9012:uint = 10921638;
      
      private static const Renamed9013:String = "—";
      
      private var nicon:DisplayObject;
      
      public function Renamed4717()
      {
         super();
         this.mouseChildren = true;
         this.buttonMode = this.useHandCursor = false;
      }
      
      private static function Renamed9014(param1:DisplayObjectContainer, param2:String, param3:uint, param4:String, param5:int, param6:int) : Label
      {
         var _loc7_:Label = null;
         (_loc7_ = new Label()).mouseEnabled = false;
         _loc7_.autoSize = TextFieldAutoSize.NONE;
         _loc7_.text = param2;
         _loc7_.color = param3;
         _loc7_.align = param4;
         _loc7_.x = param6;
         _loc7_.width = param5;
         _loc7_.height = Renamed9015.ROW_HEIGHT;
         param1.addChild(_loc7_);
         return _loc7_;
      }
      
      private static function Renamed9016(param1:DisplayObjectContainer, param2:int, param3:uint, param4:int, param5:int, param6:UserLabel) : void
      {
         var _loc7_:String = null;
         var _loc8_:Bitmap = null;
         var _loc9_:Shape = null;
         var _loc10_:int = 0;
         var _loc11_:uint = param3;
         if(param6.premium)
         {
            if(param4 > 0 || param5 > 0)
            {
               _loc11_ = Renamed9011;
               _loc7_ = Money.numToString(param4 + param5,false);
            }
            else
            {
               _loc11_ = param3;
               _loc7_ = Renamed9013;
            }
         }
         else if(param5 > 0)
         {
            _loc11_ = COLOR_NORMAL;
            _loc7_ = Money.numToString(param5,false);
         }
         else if(param6.self)
         {
            _loc11_ = Renamed9012;
            if(param4 > 0)
            {
               _loc7_ = Money.numToString(param4,false);
            }
            else
            {
               _loc7_ = Renamed9013;
            }
         }
         else
         {
            _loc11_ = param3;
            _loc7_ = Renamed9013;
         }
         var _loc12_:Label = Renamed9014(param1,_loc7_,_loc11_,TextFormatAlign.RIGHT,Renamed9015.Renamed9017,param2);
         if(param6.self && !param6.premium && param5 <= 0)
         {
            if(param4 > 0)
            {
               _loc9_ = new Shape();
               param1.addChild(_loc9_);
               _loc10_ = _loc12_.textWidth;
               _loc9_.x = _loc12_.x + Renamed9015.Renamed9017 - _loc10_ - 2;
               _loc9_.y = _loc12_.y + 9;
               _loc9_.graphics.clear();
               _loc9_.graphics.beginFill(Renamed9012);
               _loc9_.graphics.drawRect(0,0,_loc10_,1);
               _loc9_.graphics.endFill();
            }
            _loc8_ = new Bitmap(Renamed7679.Renamed7681);
            param1.addChild(_loc8_);
            _loc8_.x = param2 + Renamed9015.Renamed9017 + 4;
            _loc8_.y = Renamed9015.ROW_HEIGHT - 2 - _loc8_.height >> 1;
         }
      }
      
      [Obfuscation(rename="false")]
      override public function set data(param1:Object) : void
      {
         _data = param1;
         this.nicon = this.myIcon(_data);
      }
      
      [Obfuscation(rename="false")]
      override public function set listData(param1:ListData) : void
      {
         _listData = param1;
         label = _listData.label;
         if(this.nicon != null)
         {
            setStyle("icon",this.nicon);
         }
      }
      
      [Obfuscation(rename="false")]
      override protected function drawBackground() : void
      {
      }
      
      [Obfuscation(rename="false")]
      override protected function drawLayout() : void
      {
      }
      
      [Obfuscation(rename="false")]
      override protected function drawIcon() : void
      {
         var _loc1_:DisplayObject = icon;
         var _loc2_:Object = getStyleValue("icon");
         if(_loc2_ != null)
         {
            icon = getDisplayObjectInstance(_loc2_);
         }
         if(icon != null)
         {
            addChildAt(icon,1);
         }
         if(_loc1_ != null && _loc1_ != icon && _loc1_.parent == this)
         {
            removeChild(_loc1_);
         }
      }
      
      private function myIcon(param1:Object) : Sprite
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:uint = 0;
         var _loc4_:Label = null;
         var _loc5_:Renamed9018 = Renamed9018(param1);
         switch(_loc5_.type)
         {
            case Renamed4718.BLUE:
               _loc2_ = _loc5_.self ? new ResultWindowBlueSelected() : new ResultWindowBlueNormal();
               break;
            case Renamed4718.GREEN:
               _loc2_ = _loc5_.self ? new ResultWindowGreenSelected() : new ResultWindowGreenNormal();
               break;
            case Renamed4718.RED:
               _loc2_ = _loc5_.self ? new ResultWindowRedSelected() : new ResultWindowRedNormal();
         }
         var _loc6_:Sprite = new Sprite();
         _loc6_.addChild(_loc2_);
         if(!param1.loaded)
         {
            _loc3_ = Renamed9010;
         }
         else
         {
            _loc3_ = Boolean(param1.suspicious) ? uint(ColorConstants.SUSPICIOUS) : uint(COLOR_NORMAL);
         }
         var _loc7_:Renamed8332 = new Renamed8332(_loc5_.id);
         if(!param1.loaded)
         {
            _loc7_.setUidColor(Renamed9010,true);
         }
         else if(param1.suspicious)
         {
            _loc7_.setUidColor(ColorConstants.SUSPICIOUS,true);
         }
         else
         {
            _loc7_.setUidColor(COLOR_NORMAL,battleInfoService.isSpectatorMode());
         }
         var _loc8_:int = Renamed9015.Renamed9019;
         _loc7_.x = _loc8_ - 14;
         _loc6_.addChild(_loc7_);
         _loc8_ += Renamed9015.Renamed9020;
         if(_loc5_.type != Renamed4718.GREEN)
         {
            _loc4_ = Renamed9014(_loc6_,_loc5_.score.toString(),_loc3_,TextFormatAlign.RIGHT,Renamed9015.Renamed9021,_loc8_);
            _loc8_ += _loc4_.width;
         }
         _loc4_ = Renamed9014(_loc6_,_loc5_.kills.toString(),_loc3_,TextFormatAlign.RIGHT,Renamed9015.Renamed9022,_loc8_);
         _loc8_ += _loc4_.width;
         _loc4_ = Renamed9014(_loc6_,_loc5_.deaths.toString(),_loc3_,TextFormatAlign.RIGHT,Renamed9015.Renamed9023,_loc8_);
         _loc8_ += _loc4_.width;
         var _loc9_:Number = _loc5_.kills / _loc5_.deaths;
         var _loc10_:String = _loc5_.deaths == 0 || _loc5_.kills == 0 ? Renamed9013 : _loc9_.toFixed(2);
         _loc4_ = Renamed9014(_loc6_,_loc10_,_loc3_,TextFormatAlign.RIGHT,Renamed9015.Renamed9024,_loc8_);
         _loc8_ += _loc4_.width;
         if(_loc5_.reward > -1)
         {
            _loc4_ = Renamed9014(_loc6_,Money.numToString(_loc5_.reward,false),_loc3_,TextFormatAlign.RIGHT,Renamed9015.Renamed9025,_loc8_);
            _loc8_ += _loc4_.width;
            if(Renamed9009)
            {
               Renamed9016(_loc6_,_loc8_,_loc3_,_loc5_.Renamed4213,_loc5_.Renamed4212,_loc7_);
            }
         }
         _loc2_.width = width;
         _loc2_.height = Renamed9015.ROW_HEIGHT - 2;
         return _loc6_;
      }
   }
}

