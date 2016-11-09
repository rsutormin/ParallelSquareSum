
package us.kbase.parallelsquaresum;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Generated;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;


/**
 * <p>Original spec-file type: CalcSquareSumInputResultPair</p>
 * <pre>
 *  ===================== collect =====================
 * </pre>
 * 
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Generated("com.googlecode.jsonschema2pojo")
@JsonPropertyOrder({
    "input",
    "result"
})
public class CalcSquareSumInputResultPair {

    /**
     * <p>Original spec-file type: CalcSquareSumRunEachInput</p>
     * 
     * 
     */
    @JsonProperty("input")
    private CalcSquareSumRunEachInput input;
    /**
     * <p>Original spec-file type: CalcSquareSumRunEachOutput</p>
     * <pre>
     *  ===================== runEach =====================
     * </pre>
     * 
     */
    @JsonProperty("result")
    private CalcSquareSumRunEachOutput result;
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    /**
     * <p>Original spec-file type: CalcSquareSumRunEachInput</p>
     * 
     * 
     */
    @JsonProperty("input")
    public CalcSquareSumRunEachInput getInput() {
        return input;
    }

    /**
     * <p>Original spec-file type: CalcSquareSumRunEachInput</p>
     * 
     * 
     */
    @JsonProperty("input")
    public void setInput(CalcSquareSumRunEachInput input) {
        this.input = input;
    }

    public CalcSquareSumInputResultPair withInput(CalcSquareSumRunEachInput input) {
        this.input = input;
        return this;
    }

    /**
     * <p>Original spec-file type: CalcSquareSumRunEachOutput</p>
     * <pre>
     *  ===================== runEach =====================
     * </pre>
     * 
     */
    @JsonProperty("result")
    public CalcSquareSumRunEachOutput getResult() {
        return result;
    }

    /**
     * <p>Original spec-file type: CalcSquareSumRunEachOutput</p>
     * <pre>
     *  ===================== runEach =====================
     * </pre>
     * 
     */
    @JsonProperty("result")
    public void setResult(CalcSquareSumRunEachOutput result) {
        this.result = result;
    }

    public CalcSquareSumInputResultPair withResult(CalcSquareSumRunEachOutput result) {
        this.result = result;
        return this;
    }

    @JsonAnyGetter
    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    @JsonAnySetter
    public void setAdditionalProperties(String name, Object value) {
        this.additionalProperties.put(name, value);
    }

    @Override
    public String toString() {
        return ((((((("CalcSquareSumInputResultPair"+" [input=")+ input)+", result=")+ result)+", additionalProperties=")+ additionalProperties)+"]");
    }

}
