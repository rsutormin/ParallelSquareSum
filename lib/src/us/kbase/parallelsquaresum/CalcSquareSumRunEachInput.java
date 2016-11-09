
package us.kbase.parallelsquaresum;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Generated;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import us.kbase.common.service.Tuple1;


/**
 * <p>Original spec-file type: CalcSquareSumRunEachInput</p>
 * 
 * 
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Generated("com.googlecode.jsonschema2pojo")
@JsonPropertyOrder({
    "method",
    "input_arguments"
})
public class CalcSquareSumRunEachInput {

    /**
     * <p>Original spec-file type: FullMethodQualifier</p>
     * <pre>
     *  ===================== prepare =====================
     * </pre>
     * 
     */
    @JsonProperty("method")
    private FullMethodQualifier method;
    @JsonProperty("input_arguments")
    private Tuple1 <CalcSquareSumTask> inputArguments;
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    /**
     * <p>Original spec-file type: FullMethodQualifier</p>
     * <pre>
     *  ===================== prepare =====================
     * </pre>
     * 
     */
    @JsonProperty("method")
    public FullMethodQualifier getMethod() {
        return method;
    }

    /**
     * <p>Original spec-file type: FullMethodQualifier</p>
     * <pre>
     *  ===================== prepare =====================
     * </pre>
     * 
     */
    @JsonProperty("method")
    public void setMethod(FullMethodQualifier method) {
        this.method = method;
    }

    public CalcSquareSumRunEachInput withMethod(FullMethodQualifier method) {
        this.method = method;
        return this;
    }

    @JsonProperty("input_arguments")
    public Tuple1 <CalcSquareSumTask> getInputArguments() {
        return inputArguments;
    }

    @JsonProperty("input_arguments")
    public void setInputArguments(Tuple1 <CalcSquareSumTask> inputArguments) {
        this.inputArguments = inputArguments;
    }

    public CalcSquareSumRunEachInput withInputArguments(Tuple1 <CalcSquareSumTask> inputArguments) {
        this.inputArguments = inputArguments;
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
        return ((((((("CalcSquareSumRunEachInput"+" [method=")+ method)+", inputArguments=")+ inputArguments)+", additionalProperties=")+ additionalProperties)+"]");
    }

}
