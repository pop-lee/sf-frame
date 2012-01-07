package cn.sftech.www.event
{
	import flash.events.Event;
	
	public class SFPropertyChangeEvent extends Event
	{
		public static const PROPERTY_CHANGE_EVENT : String = "propertyChangeEvent";
		
		public function SFPropertyChangeEvent()
		{
			super(PROPERTY_CHANGE_EVENT);
		}
	}
}