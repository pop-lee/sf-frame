package cn.sftech.www.event
{
	import flash.events.Event;
	
	public class SFInitializeDataEvent extends Event
	{
		public static const INITIALIZE_DATA_EVENT : String = "initializeDataEvent";
		
		public function SFInitializeDataEvent()
		{
			super(INITIALIZE_DATA_EVENT);
		}
	}
}