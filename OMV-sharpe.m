
clf; clear all

N=30000;
r1 = rand(1, N);
r2 = rand(1, N);
r3 = rand(1, N);

x1 = r1./(r1+r2+r3);
x2 = r2./(r1+r2+r3);
x3 = r3./(r1+r2+r3);

sigma = 6*x1.^2-4*x1.*x2+2*x2.^2-2*x1+1;
sigma=sqrt(sigma);
mux = 7*x1+4*x2+1;


x=[sigma;-mux]';
[membership,member_value]=find_pareto_frontier(x);

%marcar portefolios admissiveis
scatter(x(:,1),-x(:,2),0.5,'k');


hold on;
h=plot(member_value(:,1),-member_value(:,2),'');
set(h,'linewidth',1);
legend({'Data','Pareto Frontier'})
hold on

xlabel("$\sigma$",'Interpreter','latex')
ylabel("$r$",'Interpreter','latex')
grid on


%metodo pontos de pareto
%metodod retirado da net
function [membership, member_value]=find_pareto_frontier(input)
out=[];
data=unique(input,'rows');
for i = 1:size(data,1)
    
    c_data = repmat(data(i,:),size(data,1),1);
    t_data = data;
    t_data(i,:) = Inf(1,size(data,2));
    smaller_idx = c_data>=t_data;
    
    idx=sum(smaller_idx,2)==size(data,2);
    if ~nnz(idx)
        out(end+1,:)=data(i,:);
    end
end
membership = ismember(input,out,'rows');
member_value = out;
end






