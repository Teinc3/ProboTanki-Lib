package alternativa.tanks.gui
{
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.Sprite;
   import projects.tanks.client.chat.types.UserStatus;
   
   public class ChatOutput extends ScrollPane
   {
      public var firstFill:Boolean = true;
      
      public var deltaWidth:int = 9;
      
      public var selfName:String;
      
      private const numMessages:int = 80;
      
      private var _cont:Sprite;
      
      private var __width:Number;
      
      private var oldLine:ChatOutputLine;
      
      private var _showIPMode:Boolean = false;
      
      public function ChatOutput()
      {
         this._cont = new Sprite();
         super();
         this.source = this._cont;
         this.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.focusEnabled = false;
      }
      
      public function addLine(param1:UserStatus, param2:UserStatus, param3:String, param4:Boolean = false, param5:Boolean = false) : void
      {
         var _loc7_:Boolean = false;
         var _loc6_:ChatOutputLine = null;
         _loc7_ = this.verticalScrollPosition + 5 > this.maxVerticalScrollPosition || this.firstFill;
         if(this._cont.numChildren > this.numMessages)
         {
            this.shiftMessages();
            this.oldLine = null;
            _loc6_ = new ChatOutputLine(this.__width,param1,param2,param3,param4,param5);
         }
         else
         {
            _loc6_ = new ChatOutputLine(this.__width,param1,param2,param3,param4,param5);
         }
         _loc6_.showIP = this._showIPMode;
         var _loc8_:int = int(this._cont.height + 0.5);
         _loc6_.self = _loc6_.userNameTo == this.selfName;
         _loc6_.y = _loc8_;
         this._cont.addChild(_loc6_);
         this.update();
         if(_loc7_)
         {
            this.verticalScrollPosition = this.maxVerticalScrollPosition;
         }
      }
      
      public function scrollDown() : void
      {
         this.verticalScrollPosition = this.maxVerticalScrollPosition;
      }
      
      public function selectUser(param1:String, param2:Boolean = false) : void
      {
         var _loc3_:ChatOutputLine = null;
         var _loc4_:int = param2 ? int(this._cont.numChildren - 1) : int(0);
         while(_loc4_ < this._cont.numChildren)
         {
            _loc3_ = this._cont.getChildAt(_loc4_) as ChatOutputLine;
            _loc3_.light = _loc3_.userName == param1;
            _loc3_.self = _loc3_.userNameTo == this.selfName;
            _loc4_++;
         }
      }
      
      private function shiftMessages() : void
      {
         this.oldLine = this._cont.getChildAt(0) as ChatOutputLine;
         var _loc1_:Number = this.oldLine.height + this.oldLine.y;
         this._cont.removeChild(this.oldLine);
         var _loc2_:int = 0;
         while(_loc2_ < this._cont.numChildren)
         {
            this._cont.getChildAt(_loc2_).y = this._cont.getChildAt(_loc2_).y - _loc1_;
            _loc2_++;
         }
      }
      
      override public function setSize(param1:Number, param2:Number) : void
      {
         super.setSize(param1,param2);
         this.__width = param1 - this.deltaWidth;
         this.resizeLines();
      }
      
      private function resizeLines() : void
      {
         var _loc1_:ChatOutputLine = null;
         var _loc2_:int = 0;
         var _loc3_:Array = new Array();
         var _loc4_:int = 0;
         var _loc5_:* = this._cont.numChildren > 0;
         while(this._cont.numChildren > 0)
         {
            _loc1_ = this._cont.getChildAt(_loc2_) as ChatOutputLine;
            _loc1_.showIP = this._showIPMode;
            _loc1_.width = this.__width;
            _loc3_.push(_loc1_);
            this._cont.removeChildAt(0);
         }
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            _loc1_ = _loc3_[_loc2_];
            _loc4_ = int(this._cont.height + 0.5);
            _loc1_.y = _loc4_;
            this._cont.addChild(_loc1_);
            _loc2_++;
         }
         if(_loc5_)
         {
            this.update();
         }
      }
      
      public function clear() : void
      {
         var _loc1_:ChatOutputLine = null;
         var _loc2_:Array = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < this._cont.numChildren)
         {
            _loc1_ = this._cont.getChildAt(_loc3_) as ChatOutputLine;
            _loc2_.push(_loc1_);
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            this._cont.removeChild(_loc2_[_loc3_]);
            _loc3_++;
         }
         this.resizeLines();
      }
      
      public function cleanOutUsersMessages(param1:String) : void
      {
         var _loc2_:ChatOutputLine = null;
         var _loc3_:Array = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < this._cont.numChildren)
         {
            _loc2_ = this._cont.getChildAt(_loc4_) as ChatOutputLine;
            if(_loc2_.userName == param1 && !_loc2_.system)
            {
               _loc3_.push(_loc2_);
            }
            _loc4_++;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            this._cont.removeChild(_loc3_[_loc4_]);
            _loc4_++;
         }
         this.resizeLines();
      }
      
      public function set showIPMode(param1:Boolean) : void
      {
         this._showIPMode = param1;
         this.resizeLines();
      }
   }
}

