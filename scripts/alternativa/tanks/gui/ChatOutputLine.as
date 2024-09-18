package alternativa.tanks.gui
{
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import controls.statassets.StatLineBase;
   import controls.statassets.StatLineHeader;
   import controls.statassets.StatLineNormal;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import forms.userlabel.LobbyChatUserLabel;
   import projects.tanks.client.chat.types.UserStatus;
   
   public class ChatOutputLine extends Sprite
   {
      private static const SYSTEM_COLOR:uint = 8454016;
      
      private static const UID_COLOR_WITHOUT_LIGHT:uint = 1244928;
      
      private static const UID_COLOR_WITH_LIGHT:uint = 5898034;
      
      private var _output:LabelBase;
      
      private var _userName:String;
      
      private var _userNameTo:String;
      
      private var _sourceUserLabel:LobbyChatUserLabel;
      
      private var _targetUserLabel:LobbyChatUserLabel;
      
      private var _arrowLabel:LabelBase;
      
      private var _light:Boolean = false;
      
      private var _self:Boolean = false;
      
      private var _namesWidth:int = 0;
      
      private var _system:Boolean = false;
      
      private var _showIP:Boolean;
      
      private var _sourceUserIP:String;
      
      private var _width:int;
      
      private var _background:Bitmap;
      
      public function ChatOutputLine(param1:int, param2:UserStatus, param3:UserStatus, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super();
         this._width = param1;
         this._sourceUserIP = param2.ip;
         this._system = param5;
         mouseEnabled = false;
         this._background = new Bitmap();
         addChild(this._background);
         if(param2.userId != null)
         {
            this._userName = param2.uid;
            this._sourceUserLabel = new LobbyChatUserLabel(param2.userId,param2.uid,param2.rankIndex,param2.chatModeratorLevel);
            addChild(this._sourceUserLabel);
            this._sourceUserLabel.setUidColor(UID_COLOR_WITHOUT_LIGHT);
            this.updateSourceUserLabel(param3.userId == null);
         }
         if(param3.userId != null)
         {
            this._userNameTo = param3.uid;
            this._targetUserLabel = new LobbyChatUserLabel(param3.userId,param3.uid,param3.rankIndex,param3.chatModeratorLevel);
            addChild(this._targetUserLabel);
            this._targetUserLabel.setUidColor(UID_COLOR_WITHOUT_LIGHT);
            this._arrowLabel = new LabelBase();
            addChild(this._arrowLabel);
            this._arrowLabel.text = "→";
            this._arrowLabel.color = UID_COLOR_WITHOUT_LIGHT;
            this.updateTargetUserLabel();
         }
         this._output = new LabelBase();
         this._output.color = this._system ? uint(SYSTEM_COLOR) : uint(16777215);
         this._output.multiline = true;
         this._output.wordWrap = true;
         this._output.selectable = true;
         addChild(this._output);
         if(this._namesWidth > this._width / 2)
         {
            this._output.y = 15;
            this._output.x = 0;
            this._output.width = this._width - 5;
         }
         else
         {
            this._output.x = this._namesWidth + 3;
            this._output.y = 0;
            this._output.width = this._width - this._namesWidth - 8;
         }
         if(param6)
         {
            this._output.htmlText = param4;
         }
         else
         {
            this._output.text = param4;
         }
      }
      
      private function updateSourceUserLabel(param1:Boolean) : void
      {
         var _loc2_:* = "";
         if(this._sourceUserIP != "" && !this._system && this._showIP)
         {
            _loc2_ += " (" + this._sourceUserIP + ")";
         }
         else
         {
            this._sourceUserLabel.setAdditionalText("");
         }
         if(param1)
         {
            _loc2_ += ":";
         }
         if(_loc2_.length != 0)
         {
            this._sourceUserLabel.setAdditionalText(_loc2_);
         }
         if(param1)
         {
            this._namesWidth = this._sourceUserLabel.width + 2;
         }
         else
         {
            this._namesWidth = this._sourceUserLabel.width + 6;
         }
      }
      
      private function updateTargetUserLabel() : void
      {
         this._targetUserLabel.setAdditionalText(":");
         this._targetUserLabel.x = this._sourceUserLabel.x + this._sourceUserLabel.width + 14;
         this._namesWidth += this._targetUserLabel.width + 11;
         this._arrowLabel.x = this._sourceUserLabel.x + this._sourceUserLabel.width - 1;
      }
      
      override public function set width(param1:Number) : void
      {
         var _loc2_:StatLineBase = null;
         var _loc3_:BitmapData = null;
         var _loc4_:int = 0;
         this._width = int(param1);
         if(this._namesWidth > this._width / 2 && this._output.text.length * 8 > this._width - this._namesWidth)
         {
            this._output.y = 19;
            this._output.x = 0;
            this._output.width = this._width - 5;
            _loc4_ = 21;
         }
         else
         {
            this._output.x = this._namesWidth;
            this._output.y = 0;
            this._output.width = this._width - this._namesWidth - 5;
            this._output.height = 20;
         }
         this._background.bitmapData = new BitmapData(1,Math.max(int(this._output.textHeight + 7.5 + _loc4_),19),true,0);
         _loc2_ = this._self ? new StatLineHeader() : new StatLineNormal();
         if(this._light || this._self)
         {
            _loc2_.width = this._width;
            _loc2_.height = Math.max(int(this._output.textHeight + 5.5 + _loc4_),19);
            _loc2_.y = 2;
            _loc2_.graphics.beginFill(0,0);
            _loc2_.graphics.drawRect(0,0,2,2);
            _loc2_.graphics.endFill();
            _loc3_ = new BitmapData(_loc2_.width,_loc2_.height + 2,true,0);
            _loc3_.draw(_loc2_);
            this._background.bitmapData = _loc3_;
         }
      }
      
      public function set light(param1:Boolean) : void
      {
         var _loc2_:uint = 0;
         if(this._system)
         {
            return;
         }
         this._light = param1;
         if(this._light)
         {
            _loc2_ = UID_COLOR_WITH_LIGHT;
         }
         else
         {
            _loc2_ = UID_COLOR_WITHOUT_LIGHT;
         }
         if(this._sourceUserLabel != null)
         {
            this._sourceUserLabel.setUidColor(_loc2_);
         }
         if(this._targetUserLabel != null)
         {
            this._targetUserLabel.setUidColor(_loc2_);
            this._arrowLabel.color = _loc2_;
         }
         this.width = this._width;
      }
      
      public function set self(param1:Boolean) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         if(this._system)
         {
            return;
         }
         this._self = param1;
         if(this._self)
         {
            _loc3_ = TankWindowInner.GREEN;
            _loc2_ = TankWindowInner.GREEN;
         }
         else
         {
            _loc2_ = UID_COLOR_WITHOUT_LIGHT;
            _loc3_ = this._system ? uint(SYSTEM_COLOR) : uint(16777215);
         }
         if(this._sourceUserLabel != null)
         {
            this._sourceUserLabel.setUidColor(_loc2_,this._self);
         }
         if(this._targetUserLabel != null)
         {
            this._targetUserLabel.setUidColor(_loc2_);
            this._arrowLabel.color = _loc2_;
         }
         this._output.color = _loc3_;
         this.width = this._width;
      }
      
      public function set showIP(param1:Boolean) : void
      {
         this._showIP = param1;
         if(this._sourceUserLabel != null)
         {
            this.updateSourceUserLabel(this._targetUserLabel == null);
         }
         if(this._targetUserLabel != null)
         {
            this.updateTargetUserLabel();
         }
         this.width = this._width;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get system() : Boolean
      {
         return this._system;
      }
      
      public function get userNameTo() : String
      {
         return this._userNameTo;
      }
   }
}

