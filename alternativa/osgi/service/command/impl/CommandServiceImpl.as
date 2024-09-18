package alternativa.osgi.service.command.impl
{
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.command.FormattedOutput;
   
   public class CommandServiceImpl implements CommandService
   {
      private static const TOKENIZER:RegExp = /(?:[^"\s]+)|(?:"[^"]*")/g;
      
      private const DEFAULT_SCOPE:String = "cmd";
      
      public var commands:Vector.<Command>;
      
      public function CommandServiceImpl()
      {
         this.commands = new Vector.<Command>();
         super();
      }
      
      public function registerCommand(param1:String, param2:String, param3:String, param4:Array, param5:Function) : void
      {
         var _loc6_:Command = new Command(param1,param2,param3,param4,param5);
         this.commands.push(_loc6_);
      }
      
      public function removeCommand(param1:String, param2:String, param3:Array) : void
      {
         var _loc4_:Command = null;
         var _loc5_:int = 0;
         while(_loc5_ < this.commands.length)
         {
            _loc4_ = this.commands[_loc5_];
            if(this.isEqualsFullCmd(_loc4_,param1,param2))
            {
               if(_loc4_.argsType.toString() == param3.toString())
               {
                  this.commands.splice(_loc5_,1);
                  return;
               }
            }
            _loc5_++;
         }
      }
      
      public function execute(param1:String, param2:FormattedOutput) : void
      {
         var _loc3_:String = null;
         var _loc4_:Vector.<String> = null;
         var _loc5_:Vector.<String> = this.parseCommands(param1);
         var _loc6_:FormattedOutputToString = new FormattedOutputToString();
         this.parseAndExecuteCommand(_loc5_[0],[],_loc6_);
         var _loc7_:int = 1;
         while(_loc7_ < _loc5_.length)
         {
            _loc3_ = _loc5_[_loc7_];
            _loc4_ = _loc6_.content;
            _loc6_ = new FormattedOutputToString();
            this.parseAndExecuteCommand(_loc3_,[_loc4_],_loc6_);
            _loc7_++;
         }
         param2.addLines(_loc6_.content);
      }
      
      private function parseCommands(param1:String) : Vector.<String>
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:Vector.<String> = new Vector.<String>();
         var _loc5_:* = true;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         _loc7_ = 0;
         while(_loc7_ < param1.length)
         {
            _loc2_ = param1.charAt(_loc7_);
            if(_loc2_ == "\"")
            {
               _loc5_ = !_loc5_;
            }
            if(_loc2_ == "|" && _loc5_)
            {
               _loc3_ = param1.substr(_loc6_,_loc7_ - _loc6_);
               _loc4_.push(_loc3_);
               _loc6_ = _loc7_ + 1;
            }
            _loc7_++;
         }
         var _loc8_:String = param1.substr(_loc6_,param1.length - _loc6_);
         _loc4_.push(_loc8_);
         return _loc4_;
      }
      
      private function parseAndExecuteCommand(param1:String, param2:Array, param3:FormattedOutput) : void
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:Command = null;
         var _loc7_:Array = null;
         param1 = param1.replace(/^\s+|\s+$/g,"");
         var _loc8_:Array = param1.match(TOKENIZER);
         if(_loc8_.length == 0)
         {
            throw new CommandNotFoundError(param1,"");
         }
         var _loc9_:Array = (_loc8_[0] as String).split(".");
         if(_loc9_.length == 1)
         {
            _loc4_ = "cmd";
            _loc5_ = _loc9_[0];
         }
         else
         {
            if(_loc9_.length != 2)
            {
               throw new InvalidCommandFormatError(param1);
            }
            _loc4_ = _loc9_[0];
            _loc5_ = _loc9_[1];
         }
         _loc8_.shift();
         var _loc10_:int = 0;
         while(_loc10_ < this.commands.length)
         {
            _loc6_ = this.commands[_loc10_];
            if(this.isEqualsFullCmd(_loc6_,_loc4_,_loc5_))
            {
               if(_loc6_.argsType.length === _loc8_.length + param2.length)
               {
                  _loc7_ = this.convert(_loc6_.argsType,_loc8_);
                  _loc7_ = _loc7_.concat(param2);
                  _loc6_.excute(_loc7_,param3);
                  return;
               }
            }
            _loc10_++;
         }
         var _loc11_:String = "";
         _loc10_ = 0;
         while(_loc10_ < this.commands.length)
         {
            _loc6_ = this.commands[_loc10_];
            if(_loc6_.scope != this.DEFAULT_SCOPE)
            {
               if(_loc6_.cmd == _loc5_ || _loc6_.scope == _loc4_ || _loc6_.scope == _loc5_)
               {
                  _loc11_ += _loc6_.scope + "." + _loc6_.cmd + " " + _loc6_.help() + "\n";
               }
            }
            _loc10_++;
         }
         throw new CommandNotFoundError(param1,_loc11_);
      }
      
      private function isEqualsFullCmd(param1:Command, param2:String, param3:String) : Boolean
      {
         return param1.scope == param2 && param1.cmd == param3;
      }
      
      private function convert(param1:Array, param2:Array) : Array
      {
         var argsType:Array = null;
         argsType = param1;
         var stringParams:Array = param2;
         return stringParams.map(function(param1:*, param2:int, param3:Array):*
         {
            var _loc4_:* = undefined;
            var _loc5_:* = argsType[param2];
            switch(_loc5_)
            {
               case String:
                  _loc4_ = param1 as String;
                  if(_loc4_.charAt(0) == "\"")
                  {
                     _loc4_ = _loc4_.substr(1);
                  }
                  if(_loc4_.charAt(_loc4_.length - 1) == "\"")
                  {
                     _loc4_ = _loc4_.substr(0,_loc4_.length - 1);
                  }
                  return _loc4_;
               case int:
                  return int(param1);
               case uint:
                  return uint(param1);
               case Number:
                  return Number(param1);
               default:
                  return;
            }
         });
      }
   }
}

