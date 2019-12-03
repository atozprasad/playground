import yaml

class Configmap:
    def __init__(self, configroot, filename):
        self.filename=filename
        self.configRoot = configroot
        with open(filename) as fp:
            self.config = yaml.load(fp, Loader=yaml.FullLoader)      

    def getSite(self,siteKey):
        try:
            root=self.config[self.configRoot]
        except KeyError:
            #print('Key ' + self.configRoot + ' not found in ' + self.filename)
            print(self.configRoot + ' not found in  ' + self.filename +'\n')
            raise 
        try:
            return root[siteKey]
        except KeyError:
            #print('Key ' + siteKey + ' not found in ' + self.filename)
            print( siteKey + ' not found in ' + self.filename +'\n')
            raise 

    def getNsxtMgr(self,siteKey,nsxtmgrKey):
        try:
            return self.getSite(siteKey)[nsxtmgrKey]
        except KeyError:
            #print('Key ' + nsxtmgrKey + ' not found at ' + siteKey + ' in 'self.filename)
            print(nsxtmgrKey + ' not found at ' +
                  siteKey + ' in ' + self.filename + '\n')
            raise

    def getValue(self,siteKey,nsxtmgrKey,key):
        nsxtmgr= self.getNsxtMgr(siteKey,nsxtmgrKey) 
        try:
            return nsxtmgr[key]
        except KeyError:
            print(key + ' not found at ' + nsxtmgrKey + ' at ' + siteKey + ' in ' + self.filename + '\n')
            raise

    def getURL(self, siteKey, nsxtmgrKey):
        url = self.getValue(siteKey, nsxtmgrKey, 'con_type') + '://' + \
            self.getValue(siteKey, nsxtmgrKey, 'host_addr') + ':' + \
            str(self.getValue(siteKey, nsxtmgrKey, 'host_port'))
        return url
        
# Here  with example  main program for your reference
# def main():
#     rootKey = 'nsxtapi'
#     configFileName = '/Users/challagandlp/playground/python/nsxtapi/config.yaml'
    
#     Config = Configmap(rootKey, configFileName)
#     url = Config.getURL('site1', 'nsxtmgr1')
#     user = Config.getValue('site1', 'nsxtmgr1', 'auth_user')
#     pwd = Config.getValue('site1', 'nsxtmgr1', 'auth_pwd')
  
  
#     # print(url)
#     # print(user)
#     # print(pwd)


# if __name__ == "__main__":
#     main()

 
 
