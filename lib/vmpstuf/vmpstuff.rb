require "vtpapi"

class VmpStuff
  
  def initialize( info={} )
    @loginfo = info
    Vtpapi.init(info) 
  end
  
  def start_node_vm(hostid, vmid)
    Vtpapi::Nodes::Node::Qemu::Vmid::Status::Start.post(
    	{
    		:node => "#{hostid}",
    		:vmid => "#{vmid}",
    		:skiplock => "1"
    	}
    )
  end

  def stop_node_vm(hostid, vmid)
    Vtpapi::Nodes::Node::Qemu::Vmid::Status::Stop.post(
    	{
    		:node => "#{hostid}",
    		:vmid => "#{vmid}",
    		:skiplock => "1"
    	}
    )
  end
  
  def get_node_list()
  	nodelist = []
    all_resouce = Vtpapi::Cluster::Vmtree.get
    result = JSON.parse(all_resouce)
    
    if result["success"] == 1
      result["data"].each do |e|
        if e["type"] == "node"
         nodelist << e  
        end      	
      end
    else
      ;
    end
    nodelist.collect do |e|
      result = Vtpapi::Nodes::Node::Status.get(:node=>e["node"])
      src = JSON.parse(result)
      if src["success"] == 1
        e.store("cpu_percent",src["data"]["cpu_status"]["cpu_percent"])
        e.store("all_cores", src["data"]["cpu_status"]["all_cores"])
        e.store("cpu_mhz", src["data"]["cpu_status"]["cpu_mhz"])
        e.store("mem_used",src["data"]["memory_status"]["mem_used"])
        e.store("mem_total",src["data"]["memory_status"]["mem_total"])
      end
    end
    nodelist
  end

  def get_version
  	result = JSON.parse(Vtpapi::Access::Version.get)
    if result["success"] == 1
      result["data"].split(" ")[0] 
    else
    	;
    end
  end

  def get_storage_list()
    result = JSON.parse(Vtpapi::Vtpstorage.get(:start=>0, :limit=>100))
    if result["success"] == 1
      result["data"] 
    else
    	;
    end
  end

  def get_vm_list
  	vmlist = []
    all_resouce = Vtpapi::Cluster::Vmtree.get
    result = JSON.parse(all_resouce)
    if result["success"] == 1
      result["data"].each do |e|
        if e["type"] == "qemu"
         vmlist << e  
        end      	
      end
    else
      ;
    end
    vmlist
  end

end


if __FILE__ == $0
  #vmp = VmpStuff.new({:host => "200.200.165.115", :username => "admin", :password => "wjwsinfor"})
  #puts vmp.get_version
  #puts vmp.get_node_list
  
  #puts  vmp.get_storage_list
  #puts vmp.get_vm_list
end

