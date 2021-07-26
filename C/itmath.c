    int fact(int n){
        int num=1;
        for(int i=1;i<=n;i++)
        {
            num=num*i;
        }
        return num;

    }
    int isStrong(int n){
        int sum=0;
        int temp=n;
        while(temp>0){
            int digit=temp%10;
            sum=sum+fact(digit);
            temp=temp/10;
        }
        if(sum==n){
            return 1;
        }else{
            return 0;
        }
    }