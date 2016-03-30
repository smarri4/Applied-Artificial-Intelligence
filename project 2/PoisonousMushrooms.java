import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;

import nrc.fuzzy.FuzzyException;
import nrc.fuzzy.FuzzyRule;
import nrc.fuzzy.FuzzyValue;
import nrc.fuzzy.FuzzyValueVector;
import nrc.fuzzy.FuzzyVariable;
import nrc.fuzzy.LFuzzySet;
import nrc.fuzzy.LeftLinearFunction;
import nrc.fuzzy.RFuzzySet;
import nrc.fuzzy.RightLinearFunction;
import nrc.fuzzy.TriangleFuzzySet;

//name cap-shape cap-surface cap-color bruises odor gill-attachment stalk-surface-above-ring ring-type population habitat
/*Fuzzy Attributes :
 * cap-shape : bell=b,flat=f,sunken=s
 * odor : musty=m,pungent=p,foul=f
 * habitat : meadows=m,urban=u,waste=w
 * poisonous : poisonous=p,toxic=t,edible=e.
 */
public class PoisonousMushrooms {
	public static void main(String args[]) throws FuzzyException, IOException
	{
		
		RightLinearFunction rlf = new RightLinearFunction();
		LeftLinearFunction llf = new LeftLinearFunction();
		FuzzyValue isPoisonous=null;
		FuzzyValueVector fvv = null;
		
     // cap-shape : bell=b,flat=f,sunken=s
		FuzzyVariable capShape = new FuzzyVariable("cap-shape",0.0,10.0, "On a scale 1-10 sunken,flat,bell capShape");
		capShape.addTerm("sunken", new LFuzzySet(0.0,4.0,llf));
	    capShape.addTerm("flat", new TriangleFuzzySet(4.0,6.0,7.0));
	    capShape.addTerm("bell", new RFuzzySet(7.0, 10.0,rlf));  
	 // odor : musty=m,pungent=p,foul=f
	    FuzzyVariable odor = new FuzzyVariable("odor", 0.0,10.0, "0-10 Scale of musty,pungent and foul");
	    odor.addTerm("musty", new LFuzzySet(0.0,4.0,llf));
	    odor.addTerm("pungent", new TriangleFuzzySet(4.0,6.0,7.0));
	    odor.addTerm("foul", new RFuzzySet(7.0, 10.0,rlf));
	 // habitat : meadows=m,urban=u,waste=w
	    FuzzyVariable habitat = new FuzzyVariable("habitat", 0.0,10.0, "0-10 Scale of meadows,urban and waste");
	    habitat.addTerm("meadows", new LFuzzySet(0.0,4.0,llf));
	    habitat.addTerm("urban", new TriangleFuzzySet(4.0,6.0,7.0));
	    habitat.addTerm("waste", new RFuzzySet(7.0, 10.0,rlf));
	 // poisonous : poisonous=p,toxic=t,edible=e
	    FuzzyVariable poisonous = new FuzzyVariable("poisonous nature", 0.0,10.0, "0-10 Scale of edible,toxic and poisonous");
	    poisonous.addTerm("poisonous", new LFuzzySet(0.0, 3.0,llf));
	    poisonous.addTerm("toxic", new TriangleFuzzySet(3.0,4.5,6.0));
	    poisonous.addTerm("edible", new RFuzzySet(7.0, 10.0,rlf));
		
		
		
//		Rules
		 // Rule-1
	    FuzzyRule mushroomAttrib[] = new FuzzyRule[50];
		 int i = 0;

		 //rule for very slow wind and the target being very near
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"bell"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"musty"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"meadows"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"edible"));
		 // Rule-2
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"bell"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"musty"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"urban"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"edible"));
		 // Rule-3
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"bell"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"musty"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"waste"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"toxic"));
		// Rule-4
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"bell"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"pungent"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"meadows"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"toxic"));
		// Rule-5
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"bell"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"pungent"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"urban"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"edible"));
		// Rule-6
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"bell"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"pungent"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"waste"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"poisonous"));
		// Rule-7
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"bell"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"foul"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"meadows"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"toxic"));
		// Rule-8
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"bell"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"foul"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"urban"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"edible"));
		// Rule-9
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"bell"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"foul"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"waste"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"poisonous"));
		// Rule-10
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"flat"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"musty"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"meadows"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"toxic"));
		// Rule-11
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"flat"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"musty"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"urban"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"edible"));
		// Rule-12
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"flat"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"musty"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"waste"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"toxic"));
		// Rule-13
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"flat"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"pungent"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"meadows"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"toxic"));
		// Rule-14
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"flat"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"pungent"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"urban"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"edible"));
		// Rule-15
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"flat"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"pungent"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"waste"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"poisonous"));
		// Rule-16
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"flat"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"foul"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"meadows"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"poisonous"));
			// Rule-17
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"flat"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"foul"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"urban"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"toxic"));
		// Rule-18
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"flat"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"foul"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"waste"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"poisonous"));
		// Rule-19
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"sunken"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"musty"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"meadows"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"edible"));
		// Rule-20
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"sunken"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"musty"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"urban"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"edible"));
		// Rule-21
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"sunken"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"musty"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"waste"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"edible"));
		// Rule-22
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"sunken"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"pungent"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"meadows"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"edible"));
		// Rule-23
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"sunken"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"pungent"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"urban"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"edible"));
		// Rule-24
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"sunken"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"pungent"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"waste"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"toxic"));
		// Rule-25
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"sunken"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"foul"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"waste"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"poisonous"));
		// Rule-26
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"sunken"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"foul"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"urban"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"edible"));
		// Rule-27
		 mushroomAttrib[i] = new FuzzyRule();
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(capShape,"sunken"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(odor,"foul"));
		 mushroomAttrib[i].addAntecedent(new FuzzyValue(habitat,"waste"));
		 mushroomAttrib[i++].addConclusion(new FuzzyValue(poisonous,"poisonous"));
		 
		 
		 // Fetching the input variables.
		 
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		System.out.println("Do you want manual input or from a file?");
		double ishape,iodor,ihabitat;
			System.out.println("Please enter value for cap-shape:");
		  	System.out.println("sunken=0.0-4.0,flat=4.0-7.0,bell=7.0-10.0");
		  	ishape= Double.parseDouble(br.readLine());
		  	
		    System.out.println("Please enter value for odor");
		  	System.out.println("musty=0.0-4.0,pungent=4.0-7.0,foul=7.0-10.0");
		  	iodor= Double.parseDouble(br.readLine());
			
		    System.out.println("Please enter value for habitat");
		  	System.out.println("meadows=0.0-4.0,urban=4.0-7.0,waste=7.0-10.0");
		  	ihabitat= Double.parseDouble(br.readLine());
			
		
	     // create fuzzy values from the crisp values
	     FuzzyValue inpshape =  new FuzzyValue(capShape, new TriangleFuzzySet((ishape-2.5)>0.0?ishape-2.5:ishape,
	                                            ishape, (ishape+2.5)<10.0?ishape+2.5:ishape));
	     FuzzyValue inpodor =  new FuzzyValue(odor, new TriangleFuzzySet((iodor-2.5)>0.0?iodor-2.5:iodor,
	    		 								iodor, (iodor+2.5)<10.0?iodor+2.5:iodor));
	     FuzzyValue inphabitat =  new FuzzyValue(habitat, new TriangleFuzzySet((ihabitat-2.5)>0.0?ihabitat-2.5:ihabitat,
	                                            ihabitat, (ihabitat+2.5)<10.0?ihabitat+2.5:ihabitat));
	
	     for(int j=0;j<i;j++)
	    	 mushroomAttrib[j].removeAllInputs();
		
		//Firing rules

	     int rule = 0; 
	     for(int j=0;j<i;j++)
	     {
	    	 mushroomAttrib[j].addInput(inpshape);
	    	 mushroomAttrib[j].addInput(inpodor);
	    	 mushroomAttrib[j].addInput(inphabitat);
	    	 rule=j;
	    	 if (mushroomAttrib[j].testRuleMatching())
	    	 {
	    		 fvv = mushroomAttrib[j].execute();
	    		 if (isPoisonous == null)
	    			 isPoisonous = fvv.fuzzyValueAt(0);
	    		 else
	    			 isPoisonous = isPoisonous.fuzzyUnion(fvv.fuzzyValueAt(0));
	    	 }
	     }
	     double poisVal = isPoisonous.momentDefuzzify();
	     System.out.println("The poisonous nature of mushroom on a scale of 10 is : " +
	    		 poisVal+ "");
	     if(poisVal>0.0&&poisVal<4.0)
	    	 System.out.println("The mushroom is edible");
	     else  if(poisVal>4.0&&poisVal<7.0)
	    	 System.out.println("The mushroom is toxic");
	     else  if(poisVal>7.0&&poisVal<10.0)
	    	 System.out.println("The mushroom is poisonous");
	     System.out.println("\nSummary:\n\n" + mushroomAttrib[rule].getConclusions());
	     System.out.println(isPoisonous.plotFuzzyValue("x"));
	}
}
