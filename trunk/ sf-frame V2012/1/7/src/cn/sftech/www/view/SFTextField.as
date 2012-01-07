package cn.sftech.www.view
{
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	 * 文本框
	 * 默认字号--12
	 * 默认文字对齐方式--居中
	 * @author LiYunpeng
	 * 
	 */
	public class SFTextField extends SFSprite
	{
		
		private var _textField : TextField = new TextField();
		
		private var _textFormat : TextFormat = new TextFormat();
		
		private var _widthIsSetted : Boolean = false;
		
		private var _heightIsSetted : Boolean = false;
		
		public function SFTextField()
		{
			super();
			init();
		}
		
		private function init() : void
		{
			_textFormat.size = 12;
//			_textFormat.align = TextFormatAlign.CENTER;
			
			_textField.antiAliasType = AntiAliasType.ADVANCED;
			_textField.defaultTextFormat = _textFormat;
			
			addChild(_textField);
		}
		
		override public function set width(_value : Number) : void
		{
			_textField.width = _value;
			_widthIsSetted = true;
		}
		
		override public function set height(_value:Number):void
		{
			_textField.height = _value;
			_heightIsSetted = true;
		}
		
		override public function get width():Number
		{
			return _textField.width;
		}
		override public function get height():Number
		{
			return _textField.height;
		}
		
		public function set text(_text : String) : void
		{
			_textField.text = _text;
			if(!_widthIsSetted) {
				_textField.width = _textField.textWidth + 5;
			}
			if(!_heightIsSetted) {
				_textField.height = _textField.textHeight + 3;
			}
			updateFormat();
		}
		public function get text() : String
		{
			return _textField.text;
		}
		
		public function set bold(value : Boolean) : void
		{
			_textFormat.bold = value;
			updateFormat();
		}
		
		public function set selectable(_value : Boolean) : void
		{
			_textField.selectable = _value;
		}
		
		public function set size(_value : uint) : void {
			_textFormat.size = _value;
			updateFormat();
		}
		public function get size() : uint {
			return _textFormat.size as uint;
		}
		public function set wordWrap(_value : Boolean) : void
		{
			_textField.wordWrap = _value;
		}
		
		public function set color(_value : uint) : void
		{
			_textFormat.color = _value;
			updateFormat();
		}
		
		public function set textAlign(_textAlign : String) : void
		{
			_textFormat.align = _textAlign;
			updateFormat();
		}
		
		public function set font(fontName : String) : void
		{
			_textFormat.font = fontName;
			updateFormat();
		}
		
		public function get textWidth() : Number
		{
			return _textField.textWidth;
		}
		public function get textHeight() : Number
		{
			return _textField.textHeight;
		}
		
		public function addEvent():void
		{
		}
		
		public function removeEvent():void
		{
		}
		
		private function updateFormat() : void
		{
			_textField.setTextFormat(_textFormat);
		}

	}
}