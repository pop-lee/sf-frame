package cn.sftech.www.util
{
	import cn.sftech.www.view.SFApplication;
	import cn.sftech.www.view.SFTextField;
	
	public class LogManager
	{
		private static var _logField : SFTextField = new SFTextField();
		
		public function LogManager()
		{
		}
		
		public static function print(value : String) : void
		{
			_logField.width = SFApplication.application.stageWidth - 20;
			_logField.height = SFApplication.application.stageHeight - 20;
			_logField.wordWrap = true;
			_logField.x = 10;
			_logField.y = 10;
			_logField.size = 24;
			_logField.backgroundAlpha = 1;
			_logField.text = "";
//			_logField.visible = false;
			_logField.text = value + "\n";
//			hideLog();
			if(_logField.parent == null) {
				SFApplication.application.addChild(_logField);
			}
		}
		
		public static function hideLog() : void
		{
			if(_logField.parent != null) {
				SFApplication.application.removeChild(_logField);
			}
		}
	}
}